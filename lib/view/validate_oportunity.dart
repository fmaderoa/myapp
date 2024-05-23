
import 'package:flutter/material.dart';
import 'package:myapp/view/estilotitulo.dart';
import 'package:redis/redis.dart';

class CaptureCheck extends StatefulWidget {
  const CaptureCheck({super.key});

  @override
  State<CaptureCheck> createState() => _CaptureState();
}

class _CaptureState extends State<CaptureCheck> {
  int _isValidOportunity = 0;
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _clientCodeController = TextEditingController();
  void changeState (String response) {
    print("entra aca");
    if (response == "Lost") {
      setState(() {
        _isValidOportunity = -1;
      });
    } else {
      setState(() {
        _isValidOportunity = 1;
      });
    }
  }

  final conn = RedisConnection();


void _isValid(String clientCode) async {
    print('Validating opportunity');

    final conn = RedisConnection();
    Command client;

    try {
      // Connect to the Redis server
      client = await conn.connectSecure(
        'redis-17205.c245.us-east-1-3.ec2.redns.redis-cloud.com', 
        17205
      );

      // Authenticate with the Redis server
      final authResponse = await client.send_object(["AUTH", "sTGiKr1gp3nrYoyXVPdv9zhdFW8H2eOC"]);
      if (authResponse.toString() != 'OK') {
        print('Authentication failed');
        await conn.close();
        return;
      }

      // Fetch the value for the given clientCode
      final result = await client.send_object(["GET", clientCode]);

      // Handle the result
      print("Connection established");
      changeState(result);
    } catch (e) {
      // Print error message
      print('Error: $e');
    } finally {
      // Ensure the connection is closed
      //Si conexión no es nula intente cerrar la conexión
      //await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar oportunidad'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const EstiloTitulo(textoTitulo: 'Ingrese numero de oportunidad'),      
                const SizedBox(height: 30,),
                // Client code text field
                TextFormField(
                  controller: _clientCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Número oportunidad',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un código';
                    }
                    return null;
                  },
                ),

                // Submit button
                ElevatedButton(
                  onPressed: () {
                    final String value = _clientCodeController.text;
                    if (_formKey.currentState!.validate()) {
                      _isValid(value);
                    }
                  },
                  child: const Text('Guardar Datos'),
                ),
                // Show the result of the validation
                if (_isValidOportunity == 1)
                  const Text(
                    'La oportunidad es válida',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                  // Show the result of the validation when it is not valid
                if (_isValidOportunity == -1)
                  const Text(
                    'La oportunidad no es válida',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

