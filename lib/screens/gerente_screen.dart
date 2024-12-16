import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pedido_provider.dart';
import '../providers/auth_provider.dart'; // Importamos el AuthProvider
import '../styles.dart';

class GerenteScreen extends StatelessWidget {
  const GerenteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pedidoProvider = Provider.of<PedidoProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos Realizados', style: AppTextStyles.title),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Icono de salir
            onPressed: () {
              // Cierra la sesión y regresa a la pantalla de login
              authProvider.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', // Ruta a la que vamos
                    (route) => false, // Elimina todas las rutas anteriores
              );
            },
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pedidoProvider.pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidoProvider.pedidos[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Cliente: ${pedido.nombreCliente}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pedido.productos
                          .map((prod) => Text(
                          '${prod['nombre']} x${prod['cantidad']} - \$${prod['precio']}'))
                          .toList(),
                    ),
                    trailing: Text(
                      '\$${pedido.totalPagado.toStringAsFixed(2)}',
                      style: AppTextStyles.totalPrice,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.deepOrangeAccent,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total Generado: \$${pedidoProvider.calcularTotalGenerado().toStringAsFixed(2)}',
              style: AppTextStyles.totalPrice,
            ),
          ),
        ],
      ),
    );
  }
}
