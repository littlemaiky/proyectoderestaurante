import 'package:flutter/material.dart';  // Importa las herramientas esenciales de Flutter para crear interfaces y manejar estado.
import '../models/producto.dart';  // Importa el modelo Producto para trabajar con los productos del carrito.

class CarritoProvider extends ChangeNotifier {
  // Lista privada que almacena los productos en el carrito.
  final List<Producto> _carrito = [];

  // Getter para obtener la lista de productos del carrito.
  List<Producto> get carrito => _carrito;

  // Método para agregar un producto al carrito.
  void agregarProducto(Producto producto) {
    // Busca si el producto ya existe en el carrito, comparando por el 'id'.
    final index = _carrito.indexWhere((item) => item.id == producto.id);

    if (index >= 0) {
      // Si el producto ya está en el carrito, aumenta su cantidad.
      _carrito[index].cantidad += 1;
    } else {
      // Si el producto no está en el carrito, lo agrega con cantidad inicial de 1.
      _carrito.add(Producto(
        id: producto.id,
        nombre: producto.nombre,
        descripcion: producto.descripcion,
        precio: producto.precio,
        tipo: producto.tipo,
        cantidad: 1,  // Inicia con cantidad 1.
      ));
    }
    // Notifica a los widgets que están escuchando que ha habido un cambio en el estado.
    notifyListeners();
  }

  // Método para disminuir la cantidad de un producto en el carrito.
  void disminuirCantidad(Producto producto) {
    // Encuentra el índice del producto en el carrito.
    final index = _carrito.indexWhere((item) => item.id == producto.id);

    if (index >= 0 && _carrito[index].cantidad > 1) {
      // Si el producto está en el carrito y la cantidad es mayor que 1, reduce la cantidad.
      _carrito[index].cantidad -= 1;
    } else {
      // Si la cantidad es 1 o menor, elimina el producto del carrito.
      _carrito.removeAt(index);
    }
    // Notifica a los listeners para que actualicen la interfaz.
    notifyListeners();
  }

  // Método para aumentar la cantidad de un producto en el carrito.
  void aumentarCantidad(Producto producto) {
    // Encuentra el índice del producto en el carrito.
    final index = _carrito.indexWhere((item) => item.id == producto.id);

    if (index >= 0) {
      // Si el producto está en el carrito, aumenta la cantidad en 1.
      _carrito[index].cantidad += 1;
    }
    // Notifica a los listeners para actualizar la interfaz.
    notifyListeners();
  }

  // Método para vaciar el carrito.
  void vaciarCarrito() {
    // Elimina todos los productos del carrito.
    _carrito.clear();
    // Notifica a los listeners para que actualicen la interfaz.
    notifyListeners();
  }

  // Método para calcular el total del precio de los productos en el carrito.
  double calcularTotal() {
    double total = 0.0;
    // Recorre todos los productos del carrito y suma el precio multiplicado por la cantidad.
    for (var producto in _carrito) {
      total += producto.precio * producto.cantidad;
    }
    // Retorna el total calculado.
    return total;
  }
}
