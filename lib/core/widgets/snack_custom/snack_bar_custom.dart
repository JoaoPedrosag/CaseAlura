import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class SnackBarCustom {
  static void success(String text) {
    asuka.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: Row(children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }

  static void error(String text) {
    asuka.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromRGBO(152, 0, 0, 6),
      content: Row(children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }

  static void alert(String text) {
    asuka.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromRGBO(38, 0, 98, 1),
      content: Row(children: [
        const Icon(
          Icons.contact_support_rounded,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }
}
