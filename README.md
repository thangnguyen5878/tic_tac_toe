# Tic Tac Toe

## Giới thiệu

Tic Tac Toe là một ứng dụng trò chơi cờ caro được phát triển cho nền tảng Android bằng Flutter. Ứng dụng cung cấp trải nghiệm chơi game với hai chế độ: Offline và Online, kèm theo khả năng tùy chỉnh kích thước bàn cờ và xem lại lịch sử.

## Tính năng chính

- **Chơi theo lượt**: Hai người chơi luân phiên đánh dấu X và O trên bàn cờ
- **Chế độ Offline**: Chơi trực tiếp trên cùng thiết bị không cần kết nối mạng
- **Chế độ Online**: Chơi trực tuyến với người chơi khác (Yêu cầu đăng nhập)
- **Tùy chỉnh kích thước bàn cờ**: Lựa chọn kích thước bàn cờ khi tạo phòng chơi
- **Lưu lịch sử trận đấu**: Xem lại và theo dõi tỉ số các ván đấu đã chơi 

## Công nghệ sử dụng

- Flutter/Dart
- Firebase Firestore (Cơ sở dữ liệu cloud)
- Firebase Authentication (Xác thực người dùng)
- Isar Database (Cơ sở dữ liệu local)
- GetX (Quản lý trạng thái)

## Cấu hình dự án
Clone dự án:
```bash
git clone https://github.com/thangnguyen5878/tic_tac_toe
cd tic_tac_toe
```

Đăng nhập Firebase:
```bash
firebase login
```

Kích hoạt FlutterFire:
```bash
# Cài đặt FlutterFire CLI
dart pub global activate flutterfire_cli
```

Tạo SHA1 và SHA256
Tham khảo: https://developers.google.com/android/guides/client-auth?hl=vi#maclinux
**MAX/Linux**:
```
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
```
**Windows**:
```
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```
Ví dụ:
```
keytool -list -v -alias androiddebugkey -keystore C:\Users\ADMIN\.android\debug.keystore
```

Cấu hình khóa SHA 
1. Truy cập Firebase Console
2. Vào phần cài đặt dự án
3. Trong tab "Your apps", chọn ứng dụng Android
4. Thêm SHA1 và SHA256 vào mục "SHA certificate fingerprints"
![Thêm SHA Keys vào Firebase](https://i.imgur.com/YNytrjC.png)

5. Tải file `google-services.json` từ Firebase Console
6. Đặt file vào thư mục `android/app` trong dự án

Chạy lệnh để làm sạch dự án:
```bash
flutter clean
flutter run
```
