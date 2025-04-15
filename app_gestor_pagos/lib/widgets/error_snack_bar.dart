import 'package:flutter/material.dart';

// SnackBar → Para errores menores que el usuario debe notar pero no son críticos.
class ErrorSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}

// USO:
// try {
//   throw Exception("Error en la operación");
// } catch (e) {
//   ErrorSnackBar.show(context, e.toString());
// }
