# 🛍️ BEE SHOP

A smart Flutter e-commerce app for browsing and purchasing products with a clean, modern UI.

---

## 📱 Screenshots
![photo_2026-03-16_22-19-04](https://github.com/user-attachments/assets/c8fa08fe-f0cb-4883-ab3e-912c9df48f55)
![photo_2026-03-16_22-19-09](https://github.com/user-attachments/assets/fbae1642-4788-41e0-9ec1-b95f1cddf5f8)
![photo_2026-03-16_22-19-13](https://github.com/user-attachments/assets/a7a25650-f9a2-4e40-a15b-6c6420068a20)

---

## ✨ Features

- 🔍 Browse products fetched from a live API
- 🛒 Add / remove items from cart with quantity controls
- 💰 Real-time cart total calculation
- 📦 Detailed product view with description
- 🔔 Cart badge showing live item count
- ⚠️ Error handling with retry support
- 💫 Animated splash screen

---

## 🏗️ Project Structure

```
lib/
├── main.dart
├── models/
│   └── product_models.dart
├── providers/
│   ├── product_provider.dart
│   └── cart_provider.dart
├── screens/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── product_detail.dart
│   └── cart_screen.dart
├── services/
│   └── api_services.dart
└── widgets/
    └── product_card.dart
```

---

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| [Flutter](https://flutter.dev) | UI framework |
| [Provider](https://pub.dev/packages/provider) | State management |
| [HTTP](https://pub.dev/packages/http) | API calls |
| [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) | App icon generation |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.11.0`
- Dart SDK
- Android Studio / Xcode (for device emulation)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/arif-kdt/b_shopping.git
   cd b_shopping
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Generate App Icon

```bash
dart run flutter_launcher_icons
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.6.0
  provider: ^6.1.5+1

dev_dependencies:
  flutter_launcher_icons: ^0.14.4
  flutter_lints: ^6.0.0
```

---

## 🔌 API

This app fetches product data from a REST API. Configure the base URL inside `lib/services/api_services.dart`.

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Your Name**  
GitHub: [@arif-kdt](https://github.com/arif-kdt)
