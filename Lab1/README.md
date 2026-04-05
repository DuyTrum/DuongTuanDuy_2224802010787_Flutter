# Lab 1 - Flutter & Dart Learning Projects

## 🎥 Video Report

[![Xem Video Report](https://img.shields.io/badge/Click%20to%20Watch-Video%20Report-red)](https://drive.google.com/file/d/1HRPVIrf3jwhaW7NfJUyJ6knQzEjAgsqO/view?usp=drive_link)

[![Xem Demo](https://img.shields.io/badge/Click%20to%20Watch-Video%20Demo-blue)](https://drive.google.com/file/d/19D7T99HSMD50LUAPn6QpbhxepxmswSVB/view)

---

## 📚 Giới Thiệu

**Lab 1** là bài thực hành đầu tiên về **Flutter** và **Dart**. Repository này bao gồm 3 project riêng biệt, mỗi project có mục đích khác nhau trong quá trình học tập.

---

## 📁 Cấu Trúc Repository

```
DuongTuanDuy_2224802010787_Lab1/
├── duongtuanduy_2224802010787_lab1_1/  # Flutter App - Demo cơ bản
├── duongtuanduy_2224802010787_lab1_2/  # Dart CLI - Command Line
├── duongtuanduy_2224802010787_lab1_3/  # Flutter App - UI/UX nâng cao
└── README.md                            # File này
```

---

## 🚀 Các Project Trong Repository

### 1️⃣ **Lab 1.1** - Flutter Demo Application
📂 **Thư mục:** `duongtuanduy_2224802010787_lab1_1/`

**Mô tả:**
- Ứng dụng Flutter cơ bản - Demo app đầu tiên
- Hỗ trợ đa nền tảng: iOS, Android, Web, Windows, Linux, macOS
- Sử dụng Material Design

**Công nghệ:**
- **Flutter SDK:** ^3.9.2
- **Platform:** Mobile (iOS/Android), Web, Desktop

**Cách chạy:**
```bash
cd duongtuanduy_2224802010787_lab1_1
flutter pub get
flutter run
```

**Tập tin chính:** [lib/main.dart](duongtuanduy_2224802010787_lab1_1/lib/main.dart)

---

### 2️⃣ **Lab 1.2** - Dart Command-Line Application
📂 **Thư mục:** `duongtuanduy_2224802010787_lab1_2/`

**Mô tả:**
- Ứng dụng Dart dòng lệnh (CLI)
- Hỗ trợ thực hành Dart cơ bản
- Bao gồm unit tests

**Công nghệ:**
- **Dart SDK:** ^3.9.2
- **Dependencies:** `path: ^1.9.0`
- **Dev Dependencies:** `lints`, `test`

**Cách chạy:**
```bash
cd duongtuanduy_2224802010787_lab1_2
dart pub get
dart run bin/duongtuanduy_2224802010787_lab1_2.dart
```

**Chạy tests:**
```bash
dart test
```

**Tập tin chính:** [bin/duongtuanduy_2224802010787_lab1_2.dart](duongtuanduy_2224802010787_lab1_2/bin/duongtuanduy_2224802010787_lab1_2.dart)

---

### 3️⃣ **Lab 1.3** - Flutter Advanced Application
📂 **Thư mục:** `duongtuanduy_2224802010787_lab1_3/`

**Mô tả:**
- Ứng dụng Flutter nâng cao - Demo UI/UX
- Sử dụng Assets (hình ảnh)
- Hỗ trợ đa nền tảng: iOS, Android, Web, Windows, Linux, macOS
- Giao diện hấp dẫn hơn với Container, Column, Image

**Công nghệ:**
- **Flutter SDK:** ^3.9.2
- **Platform:** Mobile (iOS/Android), Web, Desktop

**Assets:**
- `assets/images/Google-flutter-logo.jpg`

**Cách chạy:**
```bash
cd duongtuanduy_2224802010787_lab1_3
flutter pub get
flutter run
```

**Tập tin chính:** [lib/main.dart](duongtuanduy_2224802010787_lab1_3/lib/main.dart)

---

## 🛠️ Yêu Cầu Hệ Thống

- **Dart SDK:** ^3.9.2
- **Flutter SDK:** Latest stable version (hoặc 3.9.2+)
- **OS:** Windows, macOS, Linux
- **IDE:** VS Code, Android Studio, hoặc IntelliJ IDEA (với Flutter extension)

### Cài Đặt Flutter

macOS/Linux:
```bash
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:$PWD/flutter/bin"
flutter precache
```

Windows:
- Tải từ [flutter.dev](https://flutter.dev/docs/get-started/install)
- Thêm `flutter\bin` vào PATH

Kiểm tra cài đặt:
```bash
flutter doctor
```

---

## 📦 Cài Đặt & Chạy

### Tất cả Projects

```bash
# Clone repository
git clone <repository-url>
cd Lab_PTUDDDDNT

# Flutter Projects
cd duongtuanduy_2224802010787_lab1_1  # hoặc lab1_3
flutter pub get
flutter run

# Dart CLI Project
cd duongtuanduy_2224802010787_lab1_2
dart pub get
dart run bin/duongtuanduy_2224802010787_lab1_2.dart
```

---

## 🎯 Mục Đích Học Tập

| Project | Mục Đích | Kỹ Năng Học |
|---------|----------|-----------|
| **Lab 1.1** | Làm quen Flutter | Widgets, MaterialApp, StatelessWidget |
| **Lab 1.2** | Nắm vững Dart | Hàm, biến, Unit tests |
| **Lab 1.3** | UI/UX nâng cao | Layout, Assets, Responsive Design |

---

## 📚 Tài Liệu Tham Khảo

- [Flutter Official Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Material Design Guidelines](https://material.io/design)

---

## 👨‍💻 Thông Tin Tác Giả

**Sinh viên:** Dương Tuấn Duy  
**MSSV:** 2224802010787  
**Lớp:** PTUDDDDNT

---

## 📝 Ghi Chú

- Mỗi project độc lập có thể chạy riêng biệt
- Các projects được tổ chức theo các bài lab lần lượt
- Sử dụng Flutter 3.9.2+ để đảm bảo tương thích

---

## 📄 Giấy Phép

Các project này được tạo cho mục đích học tập và đào tạo.

---
