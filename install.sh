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
CACHE_DIR="./.cache"

# Очистка перед началом
echo -e "${BLUE}Очистка node_modules и кэша...${NC}"
rm -rf node_modules package-lock.json "$CACHE_DIR" pnpm-lock.yaml

# Проверка существования файла с пакетами
if [ ! -f "$PACKAGES_FILE" ]; then
  echo -e "${RED}Файл с пакетами $PACKAGES_FILE не найден${NC}"
  exit 1
fi

# Функция для чтения пакетов из файла
read_packages() {
  grep -v '^#' "$PACKAGES_FILE" | grep -v '^$'
}

# Функция для преобразования имени пакета в путь кэша
get_cache_path() {
  local package=$1
  # Заменяем @ и / на пути файловой системы
  echo "$package" | sed -e 's/^@//' -e 's/\//\//g'
}

# Функция для установки пакета с кэшированием
install_package() {
  local package=$1
  local cache_path="$CACHE_DIR/$(get_cache_path "$package")"
  
  echo -e "${BLUE}Установка $package...${NC}"
  mkdir -p "$cache_path"

  echo '
  {
  "name": "verdacio",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/TheKenkei/verdaccio-repo.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "commonjs",
  "bugs": {
    "url": "https://github.com/TheKenkei/verdaccio-repo/issues"
  },
  "homepage": "https://github.com/TheKenkei/verdaccio-repo#readme",
  "dependencies": {
  }
}'  > ./package.json

  
npm install --force --legacy-peer-deps --cache "$cache_path" "$package"@latest
# pnpm add "$package"@latest --force --config.ignore-scripts=true
  
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ $package успешно установлен${NC}"
  else
    echo -e "${RED}❌ Ошибка при установке $package${NC}"
  fi
}

# Основной код
echo -e "${BLUE}Чтение пакетов из $PACKAGES_FILE...${NC}"
packages=()
while IFS= read -r line; do
  packages+=("$line")
done < <(read_packages)

if [ ${#packages[@]} -eq 0 ]; then
  echo -e "${YELLOW}В файле не найдено ни одного пакета${NC}"
  exit 1
fi

# Установка всех пакетов
for pkg in "${packages[@]}"; do
  install_package "$pkg"
done

echo -e "${GREEN}Установка завершена. Всего установлено ${#packages[@]} пакетов${NC}"
