import 'package:flutter/material.dart';

class CircularProgressCustom extends StatelessWidget {
  const CircularProgressCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.yellow,
      color: Colors.white,
      strokeWidth: 3,
    );
  }
}
