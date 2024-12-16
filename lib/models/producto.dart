class Producto {
  final int id;  // Identificador único del producto.
  final String nombre;  // Nombre del producto.
  final String descripcion;  // Descripción del producto.
  final double precio;  // Precio del producto.
  final String tipo;  // Tipo o categoría del producto.
  int cantidad;  // Nueva propiedad que indica la cantidad de unidades del producto.

  // Constructor de la clase Producto.
  Producto({
    required this.id,  // El campo id es obligatorio.
    required this.nombre,  // El campo nombre es obligatorio.
    required this.descripcion,  // El campo descripción es obligatorio.
    required this.precio,  // El campo precio es obligatorio.
    required this.tipo,  // El campo tipo es obligatorio.
    this.cantidad = 1,  // La cantidad tiene un valor por defecto de 1 si no se especifica.
  });
}
