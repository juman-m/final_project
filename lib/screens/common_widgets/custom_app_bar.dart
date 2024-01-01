import 'package:flutter/material.dart';

AppBar CustomAppBar(String title, Function() onPressed) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    backgroundColor: const Color(0xFF0086D3),
    centerTitle: true,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 26,
        color: Colors.white,
      ),
    ),
    title: Text(title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
  );
}
