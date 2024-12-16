import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/carrito_provider.dart';
import 'tienda_screen.dart'; // Importamos la pantalla de tienda

class TransitionScreen extends StatefulWidget {
  const TransitionScreen({Key? key}) : super(key: key);

  @override
  _TransitionScreenState createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar la animación y regresar a la tienda después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<CarritoProvider>(context, listen: false).vaciarCarrito();

      // Redirigir a la pantalla de la tienda
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TiendaScreen()),
            (route) => false, // Elimina todas las rutas anteriores
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Lottie.asset(
          'animations/Animation - 1730695919261.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
