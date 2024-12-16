import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/carrito_provider.dart';
import 'providers/pedido_provider.dart';
import 'screens/login_screen.dart';
import 'screens/gerente_screen.dart'; // Importa la pantalla de gerente

void main() {
  runApp(const TiendaApp());
}

class TiendaApp extends StatelessWidget {
  const TiendaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
        ChangeNotifierProvider(create: (_) => PedidoProvider()),
      ],
      child: MaterialApp(
        title: 'Tienda de Comida',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // Ruta inicial
        routes: {
          '/login': (context) => const LoginScreen(), // Ruta de login
          '/gerente': (context) => const GerenteScreen(), // Ruta de gerente
        },
      ),
    );
  }
}
