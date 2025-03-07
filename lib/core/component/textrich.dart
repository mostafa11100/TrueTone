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
      style: TextstyleConst.texts18.copyWith(
        fontStyle: fontstyle ?? FontStyle.italic,
        fontSize: font1size,
        color:Theme.of(context).colorScheme.onSurface

      ),
      text: text1,
      children: [
        TextSpan(
          text: " $text2",
          style: TextstyleConst.texts18.copyWith(
            fontSize: font2size,
           fontStyle: FontStyle.normal,
           color:    Theme.of(context).colorScheme.primary
          ),
          recognizer: TapGestureRecognizer()..onTap = ontap,
        ),
      ],
    ),
  );
}
