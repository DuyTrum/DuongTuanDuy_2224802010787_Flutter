# Lab 6 - Role-Based User Management System

## 📋 Mô tả dự án

Hệ thống quản lý người dùng dựa trên vai trò (Role-Based User Management) được xây dựng với:
- **Backend**: ASP.NET Core Web API với Dynamic Policies
- **Frontend**: Flutter App
- **Database**: SQL Server với ASP.NET Identity

## 🎥 Video Demo

👉 [Xem video demo tại đây](https://drive.google.com/file/d/1VDKmyjXfPVdoKo346yuZVdxhCMbxLWWz/view?usp=sharing)

## 🏗️ Cấu trúc dự án

```
Lab6/
├── Role-Based-User-Management-API-Using-Dynamic-Policies-In-Asp.Net-Core-Web-API/
│   ├── Controllers/          # API Controllers
│   ├── Models/              # Data Models
│   ├── Authorization/       # Dynamic Policy Provider
│   ├── Data/                # Database Context
│   ├── Migrations/          # EF Core Migrations
│   └── CreateDatabase.sql   # SQL Script để tạo database
│
└── RoleBasedUserManagementFlutterAppWithAspNetCoreWebApi/
    ├── lib/
    │   ├── accounts/        # Login & Register
    │   ├── admin_area/      # Admin features
    │   ├── users_area/      # User features
    │   ├── models/          # Data models
    │   ├── services/        # API services
    │   ├── constants/       # Constants & configs
    │   └── shared/          # Shared widgets
    └── pubspec.yaml
```

## 🚀 Hướng dẫn cài đặt

### 1. Cài đặt Database

Chạy script SQL để tạo database:

```bash
sqlcmd -S YOUR_SERVER_NAME -i CreateDatabase.sql
```

Hoặc sử dụng PowerShell:

```powershell
Invoke-Sqlcmd -ServerInstance "YOUR_SERVER_NAME" -InputFile "CreateDatabase.sql"
```

### 2. Cấu hình Backend API

Cập nhật connection string trong `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "Default": "Server=YOUR_SERVER;Database=UserManagement;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=true"
  }
}
```

Chạy API:

```bash
cd Role-Based-User-Management-API-Using-Dynamic-Policies-In-Asp.Net-Core-Web-API
dotnet run
```

API sẽ chạy tại: `http://localhost:5129`

### 3. Chạy Flutter App

Cài đặt dependencies:

```bash
cd RoleBasedUserManagementFlutterAppWithAspNetCoreWebApi
flutter pub get
```

Chạy app trên Chrome:

```bash
flutter run -d chrome
```

## 👤 Tài khoản mặc định

Sau khi chạy script SQL, hệ thống sẽ có sẵn tài khoản Admin:

- **Email**: `freetrained@freetrained.com`
- **Password**: `freetrained123`
- **Role**: Admin

## ✨ Tính năng

### Admin Features
- ✅ Quản lý người dùng (thêm, sửa, xóa)
- ✅ Quản lý vai trò (roles)
- ✅ Gán vai trò cho người dùng
- ✅ Xem danh sách người dùng và vai trò
- ✅ Thay đổi mật khẩu
- ✅ Cập nhật thông tin cá nhân

### User Features
- ✅ Đăng ký tài khoản
- ✅ Đăng nhập
- ✅ Xem thông tin cá nhân
- ✅ Cập nhật thông tin
- ✅ Thay đổi mật khẩu

## 🔐 Bảo mật

- JWT Authentication
- Role-based Authorization với Dynamic Policies
- Password Hashing với ASP.NET Identity
- Secure API endpoints

## 🛠️ Công nghệ sử dụng

### Backend
- ASP.NET Core 8.0
- Entity Framework Core
- SQL Server
- JWT Bearer Authentication
- ASP.NET Identity

### Frontend
- Flutter
- HTTP package
- JWT Decoder
- Material Design

## 📝 API Endpoints

### Account
- `POST /api/Account/register` - Đăng ký
- `POST /api/Account/login` - Đăng nhập

### Admin
- `GET /api/Admin/users` - Lấy danh sách users
- `POST /api/Admin/add-user` - Thêm user
- `GET /api/Admin/roles` - Lấy danh sách roles
- `POST /api/Admin/add-role` - Thêm role
- `POST /api/Admin/assign-role` - Gán role cho user
- `PUT /api/Admin/update-user` - Cập nhật thông tin user
- `POST /api/Admin/change-password` - Đổi mật khẩu

### User
- `GET /api/User/profile` - Lấy thông tin profile
- `PUT /api/User/update-profile` - Cập nhật profile
- `POST /api/User/change-password` - Đổi mật khẩu

## 📚 Tài liệu tham khảo

- [ASP.NET Core Documentation](https://docs.microsoft.com/en-us/aspnet/core/)
- [Flutter Documentation](https://flutter.dev/docs)
- [ASP.NET Identity](https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity)

## 👨‍💻 Tác giả

**Dương Tuấn Duy - 2224802010787**

## 📄 License

This project is for educational purposes.
