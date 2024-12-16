import 'package:sqflite/sqflite.dart';  // Importa la biblioteca sqflite, que permite interactuar con bases de datos SQLite en Flutter.
import 'package:path/path.dart';  // Importa funciones relacionadas con la manipulación de rutas de archivos.
import '../models/producto.dart';  // Importa el modelo Producto, que representa un producto en la tienda.

class DBHelper {
  // Inicializa y abre la base de datos. Si no existe, la crea.
  static Future<Database> initDB() async {
    // Obtiene la ruta donde se almacenarán las bases de datos en el dispositivo.
    String path = join(await getDatabasesPath(), 'tienda.db');

    // Abre o crea la base de datos en la ruta especificada.
    return openDatabase(
      path,  // La ruta donde se almacenará la base de datos.

      // Definición de lo que debe suceder cuando la base de datos es creada por primera vez.
      onCreate: (db, version) {
        // Ejecuta una consulta SQL para crear la tabla 'productos' con sus columnas.
        return db.execute(
          "CREATE TABLE productos(id INTEGER PRIMARY KEY, nombre TEXT, descripcion TEXT, precio REAL, tipo TEXT)",  // Definición de la tabla con sus campos.
        );
      },
      version: 1,  // Establece la versión de la base de datos, útil para manejar migraciones de esquema.
    );
  }

  // Función para insertar un producto en la tabla 'productos'.
  static Future<void> insertProducto(Producto producto) async {
    // Abre la base de datos.
    final db = await DBHelper.initDB();

    // Inserta un nuevo producto en la tabla 'productos'.
    await db.insert(
        'productos',  // Nombre de la tabla en la que se hará la inserción.

        // Convierte el objeto Producto en un mapa clave-valor para almacenarlo en la base de datos.
        {
          'id': producto.id,
          'nombre': producto.nombre,
          'descripcion': producto.descripcion,
          'precio': producto.precio,
          'tipo': producto.tipo,
        }
    );
  }

  // Función para obtener todos los productos almacenados en la base de datos.
  static Future<List<Producto>> getProductos() async {
    // Abre la base de datos.
    final db = await DBHelper.initDB();

    // Realiza una consulta SQL para obtener todos los productos.
    final List<Map<String, dynamic>> maps = await db.query('productos');

    // Convierte los resultados de la consulta en una lista de objetos Producto.
    return List.generate(maps.length, (i) {
      return Producto(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        descripcion: maps[i]['descripcion'],
        precio: maps[i]['precio'],
        tipo: maps[i]['tipo'],
      );
    });
  }

  // Función para borrar todos los productos de la tabla 'productos'.
  static Future<void> deleteProductos() async {
    // Abre la base de datos.
    final db = await DBHelper.initDB();

    // Ejecuta una consulta SQL para eliminar todos los registros de la tabla 'productos'.
    await db.delete('productos');
  }
}
