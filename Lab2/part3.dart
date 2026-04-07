import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatelessWidget {
  const NavigationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Đây là màn hình Navigation Demo', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          FilledButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Dùng MaterialPageRoute để chuyển trang
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            label: const Text('Đi tới màn hình số 2'),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình thứ 2', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.celebration, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Hủy màn hình hiện tại để quay về (Pop)
                Navigator.pop(context);
              },
              label: const Text('Quay xe về trang cũ'),
            ),
          ],
        ),
      ),
    );
  }
}