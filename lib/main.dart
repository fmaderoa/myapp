
import 'package:flutter/material.dart';
import 'package:myapp/view/main_capture.dart';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1824201399.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1401296617.
import 'package:flutter_dotenv/flutter_dotenv.dart';  


Future<void> main() async {
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Captura Modelo Comercial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Capture(),
    );
  }
}

