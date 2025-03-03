import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

Widget richText(
  context, {
  required String text1,
  required String text2,
  required Function() ontap,
  font1size,
  font2size,
  fontstyle,
}) {
  return RichText(
    text: TextSpan(
      style: TextstyleConst.texts20.copyWith(
        fontStyle: fontstyle ?? FontStyle.italic,
        fontSize: font1size,
      ),
      text: text1,
      children: [
        TextSpan(
          text: text2,
          style: TextstyleConst.texts20.copyWith(
            fontSize: font2size,
            fontStyle: fontstyle ?? FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
          recognizer: TapGestureRecognizer()..onTap = ontap(),
        ),
      ],
    ),
  );
}
