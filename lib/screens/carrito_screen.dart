import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carrito_provider.dart';
import '../styles.dart';
import 'resumen_pedido_screen.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Carrito de Compras', style: AppTextStyles.title),
      ),
      body: carritoProvider.carrito.isEmpty
          ? const Center(
        child: Text(
          'El carrito está vacío',
          style: AppTextStyles.subtitle,
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carritoProvider.carrito.length,
              itemBuilder: (context, index) {
                final producto = carritoProvider.carrito[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Imagen de ejemplo del producto
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.fastfood,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Información del producto
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.nombre,
                                style: AppTextStyles.menuItem.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Precio Unitario: \$${producto.precio.toStringAsFixed(2)}',
                                style: AppTextStyles.subtitle,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      carritoProvider
                                          .disminuirCantidad(producto);
                                    },
                                  ),
                                  Text(
                                    '${producto.cantidad}',
                                    style: AppTextStyles.subtitle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      carritoProvider
                                          .aumentarCantidad(producto);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Precio total por producto
                        Text(
                          '\$${(producto.precio * producto.cantidad).toStringAsFixed(2)}',
                          style: AppTextStyles.totalPrice.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total a pagar:',
                        style: AppTextStyles.totalPrice),
                    Text(
                      '\$${carritoProvider.calcularTotal().toStringAsFixed(2)}',
                      style: AppTextStyles.totalPrice,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ResumenPedidoScreen(),
                      ),
                    );
                  },
                  style: AppButtonStyles.raisedButton,
                  child: const Text('Finalizar Pedido'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
