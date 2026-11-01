#!/usr/bin/env bash
# Генерує android/ та ios, перевіряє код і запускає тести.
set -euo pipefail

flutter create --platforms=android,ios --project-name lab_01 .
flutter pub get
dart format .
flutter analyze --fatal-infos --fatal-warnings
flutter test
echo "Готово. Запуск: flutter run"
