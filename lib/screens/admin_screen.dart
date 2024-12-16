import 'package:flutter/material.dart';
import '../styles.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Panel de Administrador', style: AppTextStyles.title),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenido Administrador',
          style: AppTextStyles.subtitle,
        ),
      ),
    );
  }
}
