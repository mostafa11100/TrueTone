import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

Widget cutomdivider(context, {text}) {
  return Row(
    spacing: 5.w,
    children: [
      Flexible(
        child: Container(
          height: 4,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      Flexible(child: Text(text, style: TextstyleConst.texts16)),

      Flexible(
        child: Container(
          height: 4,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    ],
  );
}
