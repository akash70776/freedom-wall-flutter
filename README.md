# Freedom Wall (Flutter) 🚧

**Current Status:** In Development

A Flutter mobile application for a Catholic Charismatic Community, facilitating weekly community reflections through an admin-moderated approval system.

---

## ⚡ Key Features (Implemented)
* **Real-time Feed:** Stream of approved reflections using Riverpod & Firestore.
* **Moderation System:** Admins approve/reject "pending" posts via a secure dashboard.
* **Anonymous Posting:** Users can submit reflections without enforced login.
* **Security:** Admin access protected by Firebase Auth and Firestore Security Rules.
* **Tab Navigation:** Feed, Share, and Guidelines as primary app sections.

## 🛠 Tech Stack
* **Flutter** (Mobile UI)
* **Firebase Firestore** (Database)
* **Firebase Auth** (Admin Login)
* **Riverpod** (State Management)

---

## 🚀 Setup & Run

1. **Clone & Install**
   ```bash
   git clone https://github.com/saybbbb/freedom-wall-flutter.git
   cd freedom-wall-flutter
   flutter pub get
   ```

2. **Firebase Config**
* This project relies on Firebase. You must add your own configuration files:
* **Android:** Place `google-services.json` in `android/app/`
* **iOS:** Place `GoogleService-Info.plist` in `ios/Runner/`

3. **Run App**
    ```bash
    flutter run
    ```

## 📂 Architecture
This project uses a **feature-first** directory structure (`/features/auth`, `/features/freedom_wall`) to separate authentication logic from the core application features.

## 📝 TODOs
* [ ] Polish UI/Theme
* [ ] Implement filtered categories
* [ ] Reflection filtering by category
* [ ] Admin analytics dashboard

## 🙏 Purpose
Built to support reflection, sharing, and spiritual growth within a Catholic Charismatic Community.

## 📄 License
For community and educational use.
