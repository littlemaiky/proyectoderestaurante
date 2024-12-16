import 'package:flutter/material.dart';
import '../models/pedido.dart';

class PedidoProvider extends ChangeNotifier {
  final List<Pedido> _pedidos = []; // Lista de pedidos registrados

  // Getter para obtener la lista de pedidos
  List<Pedido> get pedidos => _pedidos;

  // Método para agregar un pedido
  void registrarPedido(String nombreCliente, List<Map<String, dynamic>> productos, double totalPagado) {
    final nuevoPedido = Pedido(
      nombreCliente: nombreCliente,
      productos: productos,
      totalPagado: totalPagado,
    );
    _pedidos.add(nuevoPedido);
    notifyListeners();
  }

  // Método para calcular el total generado
  double calcularTotalGenerado() {
    return _pedidos.fold(0.0, (total, pedido) => total + pedido.totalPagado);
  }
}
