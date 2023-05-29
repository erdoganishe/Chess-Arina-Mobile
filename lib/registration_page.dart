import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'home.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFDA79),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              controller: passwordController,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              // ignore: unrelated_type_equality_checks
              final isLoggedIn =
                  await login(emailController.text, passwordController.text);
              if (isLoggedIn) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else {
                print("Wrong password");
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFcc8e35), // колір тексту
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
