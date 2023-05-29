import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password) async {
  try {
    print(email);
    print(password);
    // Make sure to replace 'your-login-endpoint' with your actual login endpoint URL
    final url = Uri.parse('http://25.71.143.220:3000/auth/login-mobile');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'pwd': password}),
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
      print("200");
      return true;
      // Continue with the desired flow after successful login
    } else {
      // Handle error response
      print('Login failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (error) {
    // Handle any exceptions that occurred during the request
    print('Error during login: $error');
    return false;
  }
}
