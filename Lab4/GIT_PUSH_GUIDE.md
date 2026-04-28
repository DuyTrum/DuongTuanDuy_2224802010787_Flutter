# Hướng dẫn Push Lab4 lên Git

## Bước 1: Khởi tạo Git (nếu chưa có)

```bash
cd Lab4
git init
```

## Bước 2: Thêm remote repository

```bash
git remote add origin [URL-repository-của-bạn]
```

Ví dụ:
```bash
git remote add origin https://github.com/username/lab4-flutter.git
```

## Bước 3: Add files

```bash
git add .
```

## Bước 4: Commit

```bash
git commit -m "Lab 4: ContactsApp with Firebase Authentication and Firestore"
```

## Bước 5: Push lên Git

```bash
git push -u origin main
```

Hoặc nếu branch là master:
```bash
git push -u origin master
```

## Lưu ý quan trọng:

### ⚠️ File google-services.json

File `android/app/google-services.json` chứa thông tin nhạy cảm của Firebase project. 

**Khuyến nghị:**
- Nếu repository là **private**: Có thể push lên
- Nếu repository là **public**: **KHÔNG NÊN** push file này lên

Để loại trừ file này khỏi Git:

```bash
# Thêm vào .gitignore
echo "android/app/google-services.json" >> lab4/.gitignore

# Nếu đã commit rồi, xóa khỏi Git (giữ lại local)
git rm --cached lab4/android/app/google-services.json
git commit -m "Remove google-services.json from tracking"
```

### 📝 Thay thế bằng file mẫu

Tạo file `android/app/google-services.json.example`:

```json
{
  "project_info": {
    "project_number": "YOUR_PROJECT_NUMBER",
    "project_id": "YOUR_PROJECT_ID",
    "storage_bucket": "YOUR_STORAGE_BUCKET"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "YOUR_APP_ID",
        "android_client_info": {
          "package_name": "com.lab4.lab4"
        }
      }
    }
  ]
}
```

## Kiểm tra trước khi push

```bash
# Xem các file sẽ được commit
git status

# Xem nội dung thay đổi
git diff

# Xem lịch sử commit
git log
```

## Các lệnh Git hữu ích

```bash
# Xem remote repository
git remote -v

# Tạo branch mới
git checkout -b feature-name

# Xem tất cả branches
git branch -a

# Pull code mới nhất
git pull origin main

# Xem ai commit gì
git log --oneline --graph --all
```

## Troubleshooting

### Lỗi: "failed to push some refs"

```bash
git pull origin main --rebase
git push origin main
```

### Lỗi: "Permission denied"

Kiểm tra SSH key hoặc dùng HTTPS với Personal Access Token.

### Lỗi: "Repository not found"

Kiểm tra lại URL repository:
```bash
git remote -v
git remote set-url origin [URL-mới]
```
