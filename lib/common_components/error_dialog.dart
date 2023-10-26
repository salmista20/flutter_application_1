import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext dialogContext) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: dialogContext,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Texto invalido'),
        content: const Text(
            'Por favor asegurate de completar los campos requeridos'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'))
        ],
      ),
    );
  } else {
    showDialog(
      context: dialogContext,
      builder: (ctx) => AlertDialog(
        title: const Text('Texto invalido'),
        content: const Text(
            'Por favor asegurate de completar los campos requeridos'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'))
        ],
      ),
    );
  }
}
