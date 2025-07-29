#!/bin/bash

# Проверяем, что передан аргумент с путем к директории
if [ -z "$1" ]; then
    echo "Использование: $0 <директория> [лог-файл]"
    exit 1
fi

# Директория для поиска
SEARCH_DIR="$1"

# Лог-файл (по умолчанию package_names.log)
LOG_FILE="${2:-package_names.log}"

# Очищаем лог-файл если он существует
> "$LOG_FILE"

# Функция для обработки одного package.json
process_package_json() {
    local file="$1"
    local dir=$(dirname "$file")
    
    # Извлекаем имя пакета с помощью jq (если установлен)
    if command -v jq &> /dev/null; then
        name=$(jq -r '.name' "$file" 2>/dev/null)
    else
        # Альтернатива без jq - может быть менее надежной
        name=$(grep -E '"name"' "$file" | head -1 | sed -E 's/.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
    fi
    
    # Если имя найдено и не пустое
    if [ -n "$name" ] && [ "$name" != "null" ]; then
        echo "$name" >> "$LOG_FILE"
    fi
}

# Рекурсивный поиск package.json и их обработка
find "$SEARCH_DIR" -type f -name "package.json" | while read -r file; do
    process_package_json "$file"
done

echo "Готово! Результаты записаны в $LOG_FILE"
