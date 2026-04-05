# Buổi 1 - Dartpedia Project (Example)

## 📚 Giới Thiệu

Đây là project **Dartpedia** - một ví dụ về ứng dụng Dart CLI tương tác với Wikipedia API. Project này được sử dụng làm ví dụ minh họa trong buổi học.

---

## 📁 Cấu Trúc Project

```
dartpedia/
├── cli/                    # CLI application
│   ├── bin/               # Entry point
│   ├── lib/
│   │   └── src/
│   │       ├── commands/  # Command implementations
│   │       │   ├── get_article.dart
│   │       │   └── search.dart
│   │       └── logger.dart
│   └── logs/              # Application logs
├── command_runner/        # Command runner framework
│   ├── lib/
│   │   └── src/
│   │       ├── arguments.dart
│   │       ├── command_runner_base.dart
│   │       ├── console.dart
│   │       ├── exceptions.dart
│   │       └── help_command.dart
│   └── example/
└── wikipedia/             # Wikipedia API wrapper
    ├── lib/
    │   └── src/
    │       ├── api/       # API implementations
    │       │   ├── get_article.dart
    │       │   ├── search.dart
    │       │   └── summary.dart
    │       └── model/     # Data models
    │           ├── article.dart
    │           ├── search_results.dart
    │           ├── summary.dart
    │           └── title_set.dart
    └── test/              # Unit tests
```

---

## 🚀 Tính Năng

- **Search Wikipedia:** Tìm kiếm bài viết trên Wikipedia
- **Get Article:** Lấy nội dung chi tiết của bài viết
- **Logging:** Ghi log lỗi vào file
- **Modular Design:** Chia thành 3 packages độc lập

---

## 🛠️ Cài Đặt & Chạy

### Yêu cầu
- Dart SDK ^3.9.2

### Cài đặt dependencies
```bash
cd dartpedia
dart pub get
```

### Chạy CLI
```bash
cd cli
dart run bin/cli.dart search "Dart programming"
dart run bin/cli.dart get-article "Dart_(programming_language)"
```

---

## 📦 Packages

### 1. **cli** - Command Line Interface
Entry point của ứng dụng, xử lý các lệnh từ người dùng.

### 2. **command_runner** - Command Framework
Framework để xây dựng CLI applications với command pattern.

### 3. **wikipedia** - Wikipedia API Client
Wrapper cho Wikipedia REST API, bao gồm models và API calls.

---

## 🎥 Video Demo

[![Xem Demo](https://img.shields.io/badge/Click%20to%20Watch-Video-blue)](https://drive.google.com/file/d/1fiPtgqjRGtXUxiM71JkZ_Ghg_NBzZInJ/view?usp=drive_link)

---

## 👨‍💻 Thông Tin

**Sinh viên:** Dương Tuấn Duy  
**MSSV:** 2224802010787  
**Lớp:** PTUDDDDNT

---

## 📝 Ghi Chú

- Project này là ví dụ minh họa từ buổi học
- Sử dụng workspace configuration với 3 packages
- Logs được lưu trong `cli/logs/`