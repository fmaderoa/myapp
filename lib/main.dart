
import 'package:flutter/material.dart';
import 'package:myapp/view/login.dart';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1824201399.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1401296617.


Future<void> main() async {
    
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Captura Modelo Comercial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const LoginScreen(),
    );
  }
}

