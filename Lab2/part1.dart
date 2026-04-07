import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutApp(),
      ),
    );
  }
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( // ✅ Task 3: thêm padding
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(
            "I'm in a Column and Centered.\nBelow is a Row.",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ✅ Task 1: Row căn giữa
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ✅ Task 4: bỏ loop → viết tay
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),

              const SizedBox(width: 10),

              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),

              const SizedBox(width: 10),

              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ✅ Task 2: Stack topLeft
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: 300,
                height: 200,
                color: Colors.yellow,
              ),
              const Text(
                "Stacked on Yellow Box",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}