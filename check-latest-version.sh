#!/bin/bash


# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Пути к файлам
PACKAGES_FILE="$(dirname "$0")/packages.list"
VERDACCIO_STORAGE=~/verdaccio/storage
ERROR_LOG_TGZ="./tgz-version-change.log" 


# Проверка существования файла с пакетами
if [ ! -f "$PACKAGES_FILE" ]; then
  echo -e "${RED}Файл с пакетами $PACKAGES_FILE не найден${NC}"
  exit 1
fi

# Чтение пакетов из файла (игнорируем пустые строки и комментарии)
read_packages() {
  grep -v '^#' "$PACKAGES_FILE" | grep -v '^$'
}

# Функция для получения имени файла архива
get_package_filename() {
  local package=$1
  # Для scoped-пакетов берем только имя пакета (после последнего /)
  if [[ $package == */* ]]; then
    echo "${package##*/}"
  else
    echo "$package"
  fi
}

# Функция для получения пути к директории
get_package_dir() {
  local package=$1
  # Заменяем / на %2f в scoped-пакетах
  echo "$package"
}

# Функция для сравнения версий
compare_versions() {
  local package=$1
  local package_dir=$(get_package_dir "$package")
  local package_file=$(get_package_filename "$package")
  
#   echo -e "${BLUE}Проверка $package...${NC}"
  
  # Получаем версии
  verdaccio_version=$(npm view $package version --registry http://localhost:4873 2>/dev/null)
  official_version=$(npm view $package version --registry https://registry.npmjs.org 2>/dev/null)
  
  # Проверяем ошибки
  if [ -z "$verdaccio_version" ]; then
    echo -e "${RED}❌ Пакет $package не найден в Verdaccio${NC}"
    return 1
  fi
  
  if [ -z "$official_version" ]; then
    echo -e "${YELLOW}⚠️ Пакет $package не найден в официальном реестре${NC}"
    return 1
  fi
  
  # Формируем путь к архиву
  tgz_file="$VERDACCIO_STORAGE/$package_dir/$package_file-$verdaccio_version.tgz"
  
  # Сравниваем версии
  if [ "$verdaccio_version" = "$official_version" ]; then
    echo -n -e "${GREEN}  ✅ Версия актуальна"
  else
    echo -n -e "${RED} ❌ Версия: ${package} |  $verdaccio_version | Официальная: $official_version${NC}"
  fi
  
  # Проверка файла архива
  if [ -f "$tgz_file" ]; then
    echo -e " |${GREEN}Архив найден${NC} || ${package} ($verdaccio_version)${NC}"
  else
    echo -e " | ${RED}Архив ОТСУТСТВУЕТ${NC}"
    echo -e "   Ожидаемый путь: $tgz_file"  
    echo -e "Пакет: $package@$verdaccio_version"  >> $ERROR_LOG_TGZ
    echo -e "Установить:  npm install -d --force --legacy-peer-deps --cache ./.cache/new/$package  $package@$verdaccio_version"  >> $ERROR_LOG_TGZ
    echo -e "Ожидаемый путь: $tgz_file"  >> $ERROR_LOG_TGZ
    
    # Проверка существования директории пакета
    if [ -d "$VERDACCIO_STORAGE/$package_dir" ]; then
      echo -e "   ${YELLOW}Содержимое директории:${NC}"
      echo -e "Содержимое директории:" >> $ERROR_LOG_TGZ

      ls -1 "$VERDACCIO_STORAGE/$package_dir" | head -5
      ls -1 "$VERDACCIO_STORAGE/$package_dir"  >> $ERROR_LOG_TGZ 
      echo " --- " >> $ERROR_LOG_TGZ
      echo "  " >> $ERROR_LOG_TGZ
    fi
  fi
}

# Основной код
echo -e "${BLUE}Чтение пакетов из $PACKAGES_FILE...${NC}"
echo " "  > $ERROR_LOG_TGZ
packages=()
while IFS= read -r line; do
  packages+=("$line")
done < <(read_packages)

if [ ${#packages[@]} -eq 0 ]; then
  echo -e "${YELLOW}В файле не найдено ни одного пакета${NC}"
  exit 1
fi

# Проверяем каждый пакет
for pkg in "${packages[@]}"; do
  compare_versions "$pkg"
done

echo -e "${BLUE}Проверено ${#packages[@]} пакетов${NC}"