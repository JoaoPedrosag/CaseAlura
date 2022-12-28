import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final Widget label;
  final double? width;
  final double height;
  final Color? color;
  final Gradient? gradient;

  const ButtonCustom({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.width,
    this.height = 45,
    this.color,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(20);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        child: label,
      ),
    );
  }
}
