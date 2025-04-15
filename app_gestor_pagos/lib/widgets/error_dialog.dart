import 'package:flutter/material.dart';

// AlertDialog → Para errores más importantes que requieren acción del usuario.
class ErrorDialog {
  static Future<void> show(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }
}
// USO:
// try {
//   throw Exception("Algo salió mal");
// } catch (e) {
//   ErrorDialog.show(context, e.toString());
// }
