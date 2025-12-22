# Contributing to Freedom Wall

First off, thanks for contributing! We want to keep this project fun and the codebase clean. Here are the guidelines for working on the Freedom Wall app.

## 📂 Project Structure

We follow a **Feature-First** architecture. Please respect this structure when adding new files.

* **`lib/features/`**: Contains the business logic and UI for specific features (e.g., `auth`, `freedom_wall`).
    * Inside a feature folder: `data/` (Repositories), `model/` (Classes), `provider/` (Riverpod), `ui/` (Widgets).
* **`lib/core/`**: Shared logic, themes, and utilities used across multiple features.

## 🛠 Coding Standards

### 1. State Management (Riverpod)
* Use `ConsumerWidget` or `ConsumerStatefulWidget` when listening to providers.
* Keep business logic inside **Providers** or **Repositories**, not inside the UI code.
* Avoid using `setState` for complex state; use Riverpod streams or notifiers instead.

### 2. Formatting & Linting
* We use the standard Flutter lints.
* Before committing, run:
    ```bash
    dart format .
    ```
* Resolve all warnings/errors in the "Problems" tab of your IDE.

### 3. Naming Conventions
* **Files:** `snake_case.dart`
* **Classes:** `PascalCase`
* **Variables/Functions:** `camelCase`

## 🔒 Security & Secrets

**IMPORTANT:** Never commit Firebase configuration files or API keys.

* ❌ **DO NOT COMMIT:** `google-services.json`, `GoogleService-Info.plist`, or `.env` files.
* These files are already in `.gitignore`. If you accidentally add them, remove them immediately.

## 🌿 Git Workflow

1.  **Branching:**
    * Create a new branch for every task.
    * Format: `feature/feature-name` or `fix/bug-description`.
    * Example: `feature/add-login-screen`

2.  **Commits:**
    * Write clear, concise commit messages.
    * Example: "Added login form validation" (Not just "updates").

3.  **Pull Requests (PRs):**
    * Push your branch and open a PR against `main`.
    * Briefly explain what you changed in the PR description.

## 🚀 How to Run locally

1.  Ensure you have the `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) from the project lead.
2.  Run `flutter pub get`.
3.  Run `flutter run`.