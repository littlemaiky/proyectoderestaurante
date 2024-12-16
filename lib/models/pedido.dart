class Pedido {
  final String nombreCliente; // Nombre del cliente
  final List<Map<String, dynamic>> productos; // Lista de productos con nombre, cantidad y precio
  final double totalPagado; // Total pagado por el cliente

  Pedido({
    required this.nombreCliente,
    required this.productos,
    required this.totalPagado,
  });
}
