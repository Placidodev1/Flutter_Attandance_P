import 'package:flutter/material.dart';

class PopupComponent extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  PopupComponent({
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Popup Title"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onClose,
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
