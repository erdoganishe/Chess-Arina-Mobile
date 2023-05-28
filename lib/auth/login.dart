import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String email, String password) async {
  try {
    // Make sure to replace 'your-login-endpoint' with your actual login endpoint URL
    final url = Uri.parse('127.0.0.1:3000/auth/login-mobile');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Login successful, extract tokens from the response
      final responseData = jsonDecode(response.body);
      final accessToken = responseData['accessToken'];
      final refreshToken = responseData['refreshToken'];

      // Store tokens securely using shared_preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('refreshToken', refreshToken);

      // Continue with the desired flow after successful login
    } else {
      // Handle error response
      print('Login failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    // Handle any exceptions that occurred during the request
    print('Error during login: $error');
  }
}
