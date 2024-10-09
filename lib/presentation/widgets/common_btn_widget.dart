import 'package:flutter/material.dart';

ElevatedButton commonBtn({
  required void Function()? onPressed,
  required String title,
  double height = 80,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
