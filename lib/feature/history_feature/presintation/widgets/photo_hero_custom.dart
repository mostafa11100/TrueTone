import 'package:flutter/material.dart';

Widget pHoto(photo, width) {
  return SizedBox(
    width: width,
    height: width,
    child: Hero(
      tag: photo,
      child: Material(
        color: Colors.transparent,

        child: Image.asset(photo, fit: BoxFit.fitHeight),
      ),
    ),
  );
}
