import 'dart:convert'; // Para trabajar con JSON.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para cargar el archivo JSON.

// Definición de la clase Usuario
class Usuario {
  final String email;
  final String password;
  final String nombre;
  final String nivel;

  Usuario({
    required this.email,
    required this.password,
    required this.nombre,
    required this.nivel,
  });

  // Método para crear un objeto Usuario desde JSON
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      email: json['email'],
      password: json['password'],
      nombre: json['nombre'],
      nivel: json['nivel'],
    );
  }
}

class AuthProvider extends ChangeNotifier {
  Usuario? _usuarioActual; // Usuario autenticado actualmente.
  List<Usuario> _usuarios = []; // Lista para almacenar usuarios.

  // Getter para verificar si hay un usuario autenticado
  bool get isAuthenticated => _usuarioActual != null;

  // Getter para obtener el nombre y nivel del usuario autenticado
  String? get nombreUsuario => _usuarioActual?.nombre;
  String? get nivelUsuario => _usuarioActual?.nivel;

  // Método para cargar los usuarios desde el archivo JSON
  Future<void> cargarUsuarios() async {
    final String response =
    await rootBundle.loadString('assets/usuarios.json');
    final List<dynamic> data = json.decode(response);

    _usuarios = data.map((userJson) => Usuario.fromJson(userJson)).toList();
  }

  // Método para registrar un usuario (solo en memoria)
  void registrarUsuario(
      String email, String password, String nombre, String nivel) {
    final nuevoUsuario = Usuario(
      email: email,
      password: password,
      nombre: nombre,
      nivel: nivel,
    );

    _usuarios.add(nuevoUsuario);
    print('Usuario registrado: ${nuevoUsuario.email}');
    notifyListeners();
  }

  // Método para iniciar sesión
  Future<void> login(String email, String password) async {
    if (_usuarios.isEmpty) {
      await cargarUsuarios(); // Cargar usuarios si no están cargados
    }

    final usuario = _usuarios.firstWhere(
          (user) =>
      user.email.trim() == email.trim() &&
          user.password.trim() == password.trim(),
      orElse: () => Usuario(email: '', password: '', nombre: '', nivel: ''),
    );

    if (usuario.email.isNotEmpty) {
      _usuarioActual = usuario;
      notifyListeners();
    } else {
      print('Correo o contraseña incorrectos');
    }
  }

  // Método para cerrar sesión
  void logout() {
    _usuarioActual = null;
    notifyListeners();
  }
}
