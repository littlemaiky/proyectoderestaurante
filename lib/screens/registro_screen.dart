import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../styles.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  String _nivelSeleccionado = 'Cliente';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Registro de Usuario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
              value!.isEmpty ? 'Por favor ingrese su nombre' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
              value!.isEmpty ? 'Por favor ingrese un correo' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) => value!.isEmpty
                  ? 'Por favor ingrese una contraseña válida'
                  : null,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _nivelSeleccionado,
              items: ['Cliente', 'Administrador', 'Gerente']
                  .map((nivel) =>
                  DropdownMenuItem(value: nivel, child: Text(nivel)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _nivelSeleccionado = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nivel',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider.registrarUsuario(
                      _emailController.text,
                      _passwordController.text,
                      _nombreController.text,
                      _nivelSeleccionado,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Usuario registrado exitosamente'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: AppButtonStyles.raisedButton,
                child: const Text('Registrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
