import 'package:case_alura/core/widgets/text/text_custom.dart';
import 'package:flutter/material.dart';

class ContainerCustom extends StatelessWidget {
  final String label;
  const ContainerCustom({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blueGrey[300],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextCustom(label: label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
