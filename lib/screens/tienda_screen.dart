import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carrito_provider.dart';
import '../models/producto.dart';
import '../styles.dart';
import '../widgets/producto_card.dart';
import 'carrito_screen.dart';

class TiendaScreen extends StatelessWidget {
  final List<Producto> menuProductos = [
    Producto(id: 1, nombre: 'Pizza', descripcion: 'Pizza con extra queso', precio: 15.99, tipo: 'plato'),
    Producto(id: 2, nombre: 'Hamburguesa', descripcion: 'Hamburguesa con papas fritas', precio: 10.99, tipo: 'plato'),
    Producto(id: 3, nombre: 'Ensalada', descripcion: 'Ensalada fresca con aderezo', precio: 7.99, tipo: 'plato'),
    Producto(id: 4, nombre: 'Tacos', descripcion: 'Tacos con guacamole', precio: 8.50, tipo: 'plato'),
  ];

  final List<Producto> bebidasProductos = [
    Producto(id: 5, nombre: 'Jugo de Naranja', descripcion: 'Jugo natural recién exprimido', precio: 3.50, tipo: 'bebida'),
    Producto(id: 6, nombre: 'Coca Cola', descripcion: 'Refresco de cola', precio: 2.99, tipo: 'bebida'),
    Producto(id: 7, nombre: 'Limonada', descripcion: 'Limonada casera', precio: 3.00, tipo: 'bebida'),
    Producto(id: 8, nombre: 'Café', descripcion: 'Café americano', precio: 2.50, tipo: 'bebida'),
  ];

  final List<Producto> postresProductos = [
    Producto(id: 9, nombre: 'Pastel de Chocolate', descripcion: 'Pastel casero', precio: 6.99, tipo: 'postre'),
    Producto(id: 10, nombre: 'Helado de Vainilla', descripcion: 'Helado de vainilla con chispas de chocolate', precio: 4.50, tipo: 'postre'),
    Producto(id: 11, nombre: 'Tarta de Fresa', descripcion: 'Tarta de fresa con crema', precio: 5.99, tipo: 'postre'),
    Producto(id: 12, nombre: 'Brownie', descripcion: 'Brownie con nueces', precio: 3.99, tipo: 'postre'),
  ];

  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,  // Fondo de la pantalla de tienda en verde.
        appBar: AppBar(
          backgroundColor: Colors. deepOrange,
          title: const Text('Tienda de Comida - Bienvenido', style: AppTextStyles.title),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '\$${carritoProvider.calcularTotal().toStringAsFixed(2)}',
                  style: AppTextStyles.totalPrice,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CarritoScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                carritoProvider.vaciarCarrito();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Menú'),
              Tab(text: 'Bebidas'),
              Tab(text: 'Postres'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductList(context, menuProductos),
            _buildProductList(context, bebidasProductos),
            _buildProductList(context, postresProductos),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, List<Producto> productos) {
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index) {
        return ProductoCard(
          producto: productos[index],
          onAddToCart: (producto) {
            Provider.of<CarritoProvider>(context, listen: false).agregarProducto(producto);
          },
        );
      },
    );
  }
}
