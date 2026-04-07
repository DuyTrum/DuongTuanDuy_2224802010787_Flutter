import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    final String fullName = '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Thành công! 🎉'),
          content: Text('Chào mừng đại ca $fullName đã gia nhập hệ thống.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Triển luôn'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person_outline, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 32),
            CustomTextField(label: 'First Name', controller: _firstNameController),
            const SizedBox(height: 16),
            CustomTextField(label: 'Last Name', controller: _lastNameController),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Phone Number', keyboardType: TextInputType.phone, maxLength: 10),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Password', obscureText: true),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: _showSuccessDialog,
                child: const Text('ĐĂNG KÝ NGAY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(_getIconForLabel(label)),
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    if (label.contains('Name')) return Icons.badge;
    if (label.contains('Email')) return Icons.email;
    if (label.contains('Phone')) return Icons.phone;
    if (label.contains('Password')) return Icons.lock;
    return Icons.edit;
  }
}