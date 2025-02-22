import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

// ignore: non_constant_identifier_names
Widget SimpleButton({
  onprs,
  text,
  required Color bckgrundclr,
  required Color txtcolor,
}) {
  return ElevatedButton(
    onPressed: onprs,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 134.w, vertical: 15.h),
      backgroundColor: bckgrundclr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    ),
    child: Text(
      text.toString(),
      style: TextstyleConst.texts20.copyWith(color: txtcolor),
    ),
  );
}
