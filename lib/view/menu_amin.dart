import 'package:flutter/material.dart';
import 'package:myapp/view/login.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Administrador'),
      ),
      body: Center(
        child: Text('Contenido del menú de administrador'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Registrar oportunidad'),
              onTap: () {
                // Navega a la pantalla de registro de oportunidad
                // Implementa esta navegación según tus necesidades
              },
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Validar resultado'),
              onTap: () {
                // Navega a la pantalla de validación de resultados
                // Implementa esta navegación según tus necesidades
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () {
                // Implementa aquí la lógica para cerrar sesión
                _signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    // Aquí puedes implementar la lógica para cerrar sesión
    // Esto podría ser un método que limpia las credenciales y navega a la pantalla de inicio de sesión
    // Por ejemplo:
    // Limpia las credenciales
    // Navigate back to login screen
    Navigator.pop(context); // Cerrar el menú desplegable
    // Navigate to login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
