import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';

class SnackBarCustom {
  static void success(String text) {
    Asuka.showSnackBar(SnackBar(
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
    Asuka.showSnackBar(SnackBar(
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
            style: const TextStyle(color: Colors.white),
            text,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }

  static void alert(String text) {
    Asuka.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.amber,
      content: Row(children: [
        const Icon(
          Icons.contact_support_rounded,
          color: Colors.black,
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
    ));
  }
}
