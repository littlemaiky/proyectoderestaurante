import 'package:flutter/material.dart';  // Importa las herramientas esenciales de Flutter.
import '../models/producto.dart';  // Importa el modelo Producto para manejar los productos.

class ProductoCard extends StatelessWidget {
  // El producto que se va a mostrar en la tarjeta.
  final Producto producto;

  // Función que se ejecuta cuando se añade el producto al carrito.
  final Function(Producto) onAddToCart;

  // Constructor que toma como parámetros el producto y la función para agregar al carrito.
  const ProductoCard({Key? key, required this.producto, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),  // Margen alrededor de la tarjeta.
      child: ListTile(
        title: Text(producto.nombre),  // Muestra el nombre del producto.
        subtitle: Text(producto.descripcion),  // Muestra la descripción del producto.
        trailing: Text('\$${producto.precio.toStringAsFixed(2)}'),  // Muestra el precio del producto, formateado con dos decimales.
        // Llama a la función `onAddToCart` cuando se toca la tarjeta.
        onTap: () => onAddToCart(producto),
      ),
    );
  }
}
