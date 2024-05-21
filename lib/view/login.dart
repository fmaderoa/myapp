// Suggested code may be subject to a license. Learn more: ~LicenseLog:2396887059.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1802774011.
// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:myapp/view/main_capture.dart';

// Define the LoginScreen class
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso de usuarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Email text field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),

            // Password text field
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),

            // Login button
            ElevatedButton(
              onPressed: () {
                //Ir a pantalla de captura
                goToCapture(context);
              },
              child: const Text('Ingresar'),
            ),

            // Forgot password label
            TextButton(
              onPressed: () {
                // Handle forgot password logic here
              },
              child: const Text('Olvido su password?'),
            ),
          ],
        ),
      ),
    );
  }
  
  void goToCapture(BuildContext context) {
    //Ir a la pantalla Capture
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Capture()),
    );
  }
}

