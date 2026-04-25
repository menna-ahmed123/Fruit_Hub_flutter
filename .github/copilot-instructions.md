# Copilot instructions for this repo

## Project overview
- Flutter app scaffold; primary entry point is lib/main.dart (MaterialApp + counter example).
- Project structure includes lib/core/ and lib/feature/ directories, currently empty; intended for shared core utilities and feature modules.
- Assets are configured in pubspec.yaml under flutter/assets and currently point to assets/images/.

## Key files and patterns
- App bootstrap and widget tree start in lib/main.dart.
- Linting rules come from package:flutter_lints via analysis_options.yaml.
- Pub dependencies and assets are declared in pubspec.yaml.

## Developer workflows
- Install dependencies: flutter pub get
- Run the app: flutter run
- Analyze lints: flutter analyze
- Run tests: flutter test

## Conventions to follow
- Keep new UI code in lib/ (prefer feature-specific folders under lib/feature/ when adding real screens).
- Use Material widgets; app theme is defined in MyApp in lib/main.dart.
- Add new images under assets/images/ and update pubspec.yaml if new asset paths are introduced.

## Notes on integrations
- No external services or APIs are wired yet; current code is the default Flutter counter template.
