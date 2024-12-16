import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carrito_provider.dart';
import '../providers/pedido_provider.dart';
import '../styles.dart';
import 'transition_screen.dart';

class ResumenPedidoScreen extends StatelessWidget {
  const ResumenPedidoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);
    final pedidoProvider = Provider.of<PedidoProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Resumen del Pedido', style: AppTextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalle de los productos:',
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: carritoProvider.carrito.length,
                itemBuilder: (context, index) {
                  final producto = carritoProvider.carrito[index];
                  return ListTile(
                    title: Text(producto.nombre),
                    subtitle: Text('Cantidad: ${producto.cantidad}'),
                    trailing: Text(
                        '\$${(producto.precio * producto.cantidad).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total a pagar:', style: AppTextStyles.totalPrice),
                  Text(
                    '\$${carritoProvider.calcularTotal().toStringAsFixed(2)}',
                    style: AppTextStyles.totalPrice,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Registrar el pedido
                  pedidoProvider.registrarPedido(
                    'Cliente', // Nombre del cliente (por ahora estático)
                    carritoProvider.carrito.map((producto) {
                      return {
                        'nombre': producto.nombre,
                        'cantidad': producto.cantidad,
                        'precio': producto.precio,
                      };
                    }).toList(),
                    carritoProvider.calcularTotal(),
                  );

                  // Vaciar el carrito y regresar a la tienda
                  carritoProvider.vaciarCarrito();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransitionScreen(),
                    ),
                  );
                },
                style: AppButtonStyles.raisedButton,
                child: const Text('Regresar a Tienda de Comidas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
