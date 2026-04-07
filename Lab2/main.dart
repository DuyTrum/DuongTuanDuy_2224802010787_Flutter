import 'package:flutter/material.dart';

// Import 4 file tính năng vào đây (Nhớ đảm bảo tên file trùng khớp nha)
import 'part1.dart';
import 'part2.dart';
import 'part3.dart';
import 'part4.dart';

void main() {
  runApp(const MyCustomApp());
}

class MyCustomApp extends StatelessWidget {
  const MyCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Super App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;

  // Gọi các màn hình từ 4 file đã tách
  final List<Widget> _pages = [
    const LayoutApp(),
    const ResponsiveHomePage(),
    const NavigationHomeScreen(), 
    const RegistrationPage(),
  ];

  final List<String> _titles = [
    '1. Basic Layout',
    '2. Responsive UI',
    '3. Navigation',
    '4. Register Form'
  ];

  // Hàm xử lý khi bấm vào các nút ở menu dưới đáy
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex], 
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true, // Cho title ra giữa nhìn cho cân đối
      ),
      
      // Hiển thị nội dung màn hình tương ứng
      body: _pages[_selectedIndex],
      
      // THAY ĐỔI Ở ĐÂY: Dùng BottomNavigationBar thay vì Drawer
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // fixed để hiện đủ 4 icon không bị thụt thò
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Hiện chữ cho cả những tab không được chọn
        elevation: 8, // Thêm tí bóng đổ cho nó nổi lên
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Layout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_outlined),
            activeIcon: Icon(Icons.devices),
            label: 'Responsive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined),
            activeIcon: Icon(Icons.route),
            label: 'Nav',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            activeIcon: Icon(Icons.how_to_reg),
            label: 'Form',
          ),
        ],
      ),
    );
  }
}