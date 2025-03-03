import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

Widget customButton(
  context, {
  required Function() onpress,
  required String text,
  height,
}) {
  return SizedBox(
    height: height ?? 55.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onpress,
      child: Text(text, style: TextstyleConst.texts20),
    ),
  );
}
