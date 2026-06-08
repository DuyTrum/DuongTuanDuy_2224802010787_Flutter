# Lab 4 - ContactsApp Firebase

Ứng dụng quản lý danh bạ với xác thực Firebase và Cloud Firestore.

## Thông tin sinh viên
- **Họ tên**: Dương Tuấn Duy
- **MSSV**: 2224802010787
- **Lớp**: [Tên lớp]
- **Video Demo**: [Link Google Drive](https://drive.google.com/file/d/1nmxE-1UKUl-LBadid5wfkwpbrUf7egMo/view?usp=drive_link)

## Tính năng

- ✅ Đăng nhập/Đăng ký với Email & Password
- ✅ Đăng nhập với Google (Android/iOS)
- ✅ Thêm, sửa, xóa danh bạ
- ✅ Tìm kiếm danh bạ theo tên
- ✅ Lưu trữ dữ liệu trên Cloud Firestore
- ✅ Real-time sync dữ liệu

## Công nghệ sử dụng

- **Flutter**: Framework phát triển ứng dụng
- **Firebase Authentication**: Xác thực người dùng
- **Cloud Firestore**: Cơ sở dữ liệu NoSQL
- **Google Sign-In**: Đăng nhập bằng tài khoản Google

## Cấu trúc dự án

```
lib/
├── controllers/
│   ├── auth_services.dart      # Xử lý authentication
│   └── crud_services.dart      # Xử lý CRUD operations
├── views/
│   ├── login_page.dart         # Màn hình đăng nhập
│   ├── sign_up_page.dart       # Màn hình đăng ký
│   ├── home.dart               # Màn hình danh sách contacts
│   ├── add_contact_page.dart   # Màn hình thêm contact
│   └── update_contact.dart     # Màn hình cập nhật contact
└── main.dart                   # Entry point
```

## Cài đặt

### 1. Clone repository

```bash
git clone [repository-url]
cd Lab4/lab4
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Cấu hình Firebase

1. Tạo Firebase project tại [Firebase Console](https://console.firebase.google.com/)
2. Thêm Android/iOS app vào project
3. Download `google-services.json` (Android) hoặc `GoogleService-Info.plist` (iOS)
4. Đặt file vào đúng vị trí:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`
5. Enable Authentication (Email/Password và Google)
6. Tạo Cloud Firestore Database

### 4. Chạy ứng dụng

```bash
flutter run
```

## Screenshots

[Thêm screenshots của ứng dụng ở đây]

## Tài liệu tham khảo

- [Firebase Flutter Setup](https://firebase.google.com/docs/flutter/setup)
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
- [Firebase Auth](https://pub.dev/packages/firebase_auth)
- [Google Sign In](https://pub.dev/packages/google_sign_in)

## License

This project is for educational purposes only.

