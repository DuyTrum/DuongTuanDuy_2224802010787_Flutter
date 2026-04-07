import 'package:flutter/material.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  static const Color _bodyColor = Color(0xFFE3F2FD);
  static const Color _navColor = Color(0xFF90CAF9);
  static const Color _paneColor = Color(0xFFBBDEFB);

  static const TextStyle _textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);

  static const Widget _bodyContent = Center(child: Text('Body Content', style: _textStyle));
  static const Widget _navContent = Center(child: Text('Menu', style: _textStyle));
  static const Widget _paneContent = Center(child: Text('Side Pane', style: _textStyle));

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: _buildResponsiveLayout(screenWidth),
    );
  }

  Widget _buildResponsiveLayout(double width) {
    if (width < 600) return _buildCompactScreen();
    if (width < 840) return _buildMediumScreen();
    if (width < 1200) return _buildExpandedScreen();
    return _buildLargeScreen();
  }

  Widget _buildCompactScreen() {
    return Column(
      children: [
        const Expanded(child: ColoredBox(color: _bodyColor, child: _bodyContent)),
        Container(height: 70, color: _navColor, child: _navContent),
      ],
    );
  }

  Widget _buildMediumScreen() {
    return Row(
      children: [
        Container(width: 80, color: _navColor, child: _navContent),
        const Expanded(child: ColoredBox(color: _bodyColor, child: _bodyContent)),
      ],
    );
  }

  Widget _buildExpandedScreen() {
    return Row(
      children: [
        Container(width: 80, color: _navColor, child: _navContent),
        Container(width: 360, color: _bodyColor, child: _bodyContent),
        const Expanded(child: ColoredBox(color: _paneColor, child: _paneContent)),
      ],
    );
  }

  Widget _buildLargeScreen() {
    return Row(
      children: [
        Container(width: 250, color: _navColor, child: _navContent),
        Container(width: 400, color: _bodyColor, child: _bodyContent),
        const Expanded(child: ColoredBox(color: _paneColor, child: _paneContent)),
      ],
    );
  }
}