#!/bin/bash
packages=(
  "react"
  "lodash"
  "express"
  "typescript"
  "@angular-builders/custom-webpack"
  "@angular-devkit/build-angular"
  "@angular/core"
  "@angular/common"
  "@angular/compiler"
  "react" "lodash" "express" "typescript" "@ag-grid-community/client-side-row-model" "@ag-grid-community/core &&" "@ag-grid-community/styles" "ag-grid-react" "@angular-builders/custom-webpack" "@angular-devkit/build-angular" "@angular-devkit/core" "@angular-devkit/schematics" "@angular-devkit/schematics-cli" "@angular/animations" "@angular/cdk" "@angular/cli" "@angular/common" "@angular/compiler" "@angular/compiler-cli" "@angular/core" "@angular/forms" "@angular/language-service" "@angular/localize" "@angular/platform-browser" "@angular/platform-browser-dynamic" "@angular/platform-server" "@angular/router" "autoprefixer" "@axe-core/playwright" "axe-playwright" "axios" "bcrypt" "@bluehalo/ngx-leaflet" "@bluehalo/ngx-leaflet-draw" "@bluehalo/ngx-leaflet-markercluster" "body-parser" "cesium" "chart.js" "chartjs-plugin-zoom" "class-transformer" "class-validator" "cookie-parser" "cors" "cpy-cli" "cypress" "cypress-image-diff-js" "cypress-plugin-tab" "cz-customizable" "date-fns" "dayjs" "@docsearch/css" "@docsearch/js" "dompurify" "dotenv" "@emotion/react" "@emotion/styled" "eslint" "eslint-config-prettier" "eslint-plugin-prettier" "eslint-plugin-react-hooks" "eslint-plugin-react-refresh" "eslint-plugin-unused-imports" "express" "@faker-js/faker" "@fontsource/roboto" "@fortawesome/fontawesome-free" "husky" "jest" "jest-environment-jsdom" "jest-preset-angular" "lint-staged" "lucide-static" "markdown-it" "marked" "@maskito/angular" "@maskito/core" "@maskito/kit" "@maskito/phone" "@material-design-icons/svg" "@mui/icons-material" "@mui/material" "@mui/x-charts" "@mui/x-data-grid" "@mui/x-date-pickers" "ng-morph" "ng-packagr" "@ng-web-apis/common" "@ng-web-apis/intersection-observer" "@ng-web-apis/mutation-observer" "@ng-web-apis/platform" "@ng-web-apis/resize-observer" "@ng-web-apis/screen-orientation" "@ng-web-apis/universal" "@ng-web-apis/workers" "@nguniversal/builders" "@nguniversal/express-engine" "ngx-highlightjs" "@ngx-translate/core" "@ngx-translate/http-loader" "node-loader" "@novnc/novnc" "nx" "@nx/angular" "@nx/cypress" "@nx/devkit" "@nx/eslint" "@nx/jest" "@nx/js" "@nx/playwright" "@nx/web" "@nx/workspace" "parse5" "@pbe/react-yandex-maps" "@playwright/test" "resize-observer-polyfill" "rxjs" "@schematics/angular" "showdown" "@stackblitz/sdk" "standard-version" "@swc-node/register" "@swc/core" "@swc/helpers" "@taiga-ui/addon-charts" "@taiga-ui/addon-commerce" "@taiga-ui/addon-doc" "@taiga-ui/addon-mobile" "@taiga-ui/addon-table" "@taiga-ui/auto-changelog-config" "@taiga-ui/browserslist-config" "@taiga-ui/cdk" "@taiga-ui/commitlint-config" "@taiga-ui/core" "@taiga-ui/cspell-config" "@taiga-ui/design-tokens" "@taiga-ui/dompurify" "@taiga-ui/editor" "@taiga-ui/eslint-plugin-experience" "@taiga-ui/eslint-plugin-experience-next" "@taiga-ui/event-plugins" "@taiga-ui/i18n" "@taiga-ui/icons" "@taiga-ui/jest-config" "@taiga-ui/kit" "@taiga-ui/layout" "@taiga-ui/legacy" "@taiga-ui/polymorpheus" "@taiga-ui/prettier-config" "@taiga-ui/release-it-config" "@taiga-ui/stylelint-config" "@taiga-ui/styles" "@taiga-ui/syncer" "@taiga-ui/testing" "@taiga-ui/tsconfig" "@tailwindcss/aspect-ratio" "@tailwindcss/line-clamp" "@tailwindcss/typography" "terser-webpack-plugin" "@testing-library/jest-dom" "@testing-library/react" "@testing-library/user-event" "@tiptap/core" "@tiptap/extension-blockquote" "@tiptap/extension-bold" "@tiptap/extension-bubble-menu" "@tiptap/extension-bullet-list" "@tiptap/extension-character-count" "@tiptap/extension-code" "@tiptap/extension-code-block" "@tiptap/extension-details" "@tiptap/extension-details-content" "@tiptap/extension-details-summary" "@tiptap/extension-document" "@tiptap/extension-dropcursor" "@tiptap/extension-focus" "@tiptap/extension-gapcursor" "@tiptap/extension-hard-break" "@tiptap/extension-heading" "@tiptap/extension-highlight" "@tiptap/extension-history" "@tiptap/extension-horizontal-rule" "@tiptap/extension-image" "@tiptap/extension-italic" "@tiptap/extension-link" "@tiptap/extension-list-item" "@tiptap/extension-ordered-list" "@tiptap/extension-paragraph" "@tiptap/extension-placeholder" "@tiptap/extension-strike" "@tiptap/extension-subscript" "@tiptap/extension-superscript" "@tiptap/extension-table" "@tiptap/extension-table-cell" "@tiptap/extension-table-header" "@tiptap/extension-table-of-contents" "@tiptap/extension-table-row" "@tiptap/extension-task-item" "@tiptap/extension-task-list" "@tiptap/extension-text" "@tiptap/extension-text-align" "@tiptap/extension-text-style" "@tiptap/extension-underline" "@tiptap/extension-youtube" "@tiptap/pm" "@tiptap/starter-kit" "@trivago/prettier-plugin-sort-imports" "ts-jest" "ts-mockito" "ts-node" "tslib" "@types/bcrypt" "@types/cookie-parser" "@types/cors" "@types/dompurify" "@types/dotenv" "@types/express" "@types/glob" "@types/jasmine" "@types/jest" "@types/jsonwebtoken" "@types/leaflet" "@types/leaflet-draw" "@types/leaflet.markercluster" "@types/loader-utils" "@types/markdown-it" "@types/markdown-it-container" "@types/morgan" "@types/node" "@types/novnc__novnc" "@types/passport-jwt" "@types/pg" "@types/proj4" "@types/react" "@types/react-dom" "@types/react-helmet" "@types/sequelize" "@types/showdown" "@types/supertest" "@types/uuid" "@types/validator" "@types/webpack-env" "typescript" "@typescript-eslint/eslint-plugin" "@typescript-eslint/parser" "@vitejs/plugin-react" "@vitest/ui" "webpack" 
)

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Путь к хранилищу Verdaccio
VERDACCIO_STORAGE=~/verdaccio/storage


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
  
  echo -e "${BLUE}Проверка $package...${NC}"
  
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
    echo -n -e "${GREEN}✅ Версия актуальна ($verdaccio_version)${NC}"
  else
    echo -n -e "${RED}❌ Версия: $verdaccio_version | Официальная: $official_version${NC}"
  fi
  
  # Проверка файла архива
  if [ -f "$tgz_file" ]; then
    echo -e " | ${GREEN}Архив найден${NC}"
  else
    echo -e " | ${RED}Архив ОТСУТСТВУЕТ${NC}"
    echo -e "   Ожидаемый путь: $tgz_file"
    
    # Проверка существования директории пакета
    if [ -d "$VERDACCIO_STORAGE/$package_dir" ]; then
      echo -e "   ${YELLOW}Содержимое директории:${NC}"
      ls -1 "$VERDACCIO_STORAGE/$package_dir" | head -5
    fi
  fi
}

# Проверяем каждый пакет
for pkg in "${packages[@]}"; do
  compare_versions "$pkg"
done

echo -e "${BLUE}Проверка завершена${NC}"