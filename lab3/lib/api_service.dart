import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://69ddebdd410caa3d47ba3c50.mockapi.io/login/1/';

  Future<bool> send(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$_baseUrl$endpoint', data: data);
      print('Response: ${response.data}');
      return true;
    } catch (e) {
      print('Dio error: $e');
      return false;
    }
  }
}