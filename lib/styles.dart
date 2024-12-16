import 'package:flutter/material.dart';  // Importa las herramientas esenciales de Flutter.

/// Definimos los estilos de texto para la aplicación
class AppTextStyles {
  // Estilo de texto para los títulos (por ejemplo, los títulos de las pantallas).
  static const TextStyle title = TextStyle(
    fontSize: 24,  // Tamaño de la fuente.
    fontWeight: FontWeight.bold,  // Estilo de la fuente en negrita.
    color: Colors.white,  // Color de la fuente.
  );

  // Estilo de texto para los subtítulos (por ejemplo, descripciones de secciones).
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,  // Tamaño de la fuente.
    fontWeight: FontWeight.normal,  // Fuente con peso normal.
    color: Colors.black45,  // Color de la fuente.
  );

  // Estilo de texto para los botones.
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,  // Tamaño de la fuente.
    fontWeight: FontWeight.bold,  // Negrita.
    color: Colors.yellowAccent,  // Color de la fuente.
  );

// Estilo de texto para mostrar el precio total (por ejemplo, en el carrito).
  static const TextStyle totalPrice = TextStyle(
    fontSize: 20, // Tamaño de la fuente.
    fontWeight: FontWeight.bold, // Negrita.
    color: Colors.yellowAccent, // Color de la fuente.
    shadows: [
      Shadow( // Sombra negra en la esquina superior izquierda.
        offset: Offset(-1.5, -1.5),
        color: Colors.black45,
      ),
      Shadow( // Sombra negra en la esquina superior derecha.
        offset: Offset(1.5, -1.5),
        color: Colors.black45,
      ),
      Shadow( // Sombra negra en la esquina inferior derecha.
        offset: Offset(1.5, 1.5),
        color: Colors.black45,
      ),
      Shadow( // Sombra negra en la esquina inferior izquierda.
        offset: Offset(-1.5, 1.5),
        color: Colors.black45,
      ),
    ],
  );

  // Estilo de texto para los elementos del menú (por ejemplo, los nombres de los productos).
  static const TextStyle menuItem = TextStyle(
    fontSize: 20,  // Tamaño de la fuente.
    fontWeight: FontWeight.normal,  // Fuente con peso normal.
    color: Colors.deepOrangeAccent,  // Color de la fuente.
  );
}

/// Definimos los estilos para los botones
class AppButtonStyles {
  // Estilo para los botones elevados (Raised Button).
  static final ButtonStyle raisedButton = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),  // Padding dentro del botón.
    textStyle: AppTextStyles.buttonText,  // Estilo de texto para los botones.
    backgroundColor: Colors.orangeAccent,  // Color de fondo del botón.
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),  // Bordes redondeados para el botón.
    ),
  );
}

/// Definimos los colores generales de la aplicación
class AppColors {
  // Color de fondo para ciertas pantallas o secciones.
  static const Color backgroundColor = Colors.redAccent;

  // Color primario que puede usarse en el tema de la aplicación (por ejemplo, en la AppBar).
  static const Color primaryColor = Colors.blue;

  // Color de acento que puede usarse para resaltar ciertos elementos.
  static const Color accentColor = Colors.green;
}
