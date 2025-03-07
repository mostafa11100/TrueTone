import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

cutomotp(context,Function(String verification)? onsubmit)
{
 ColorScheme color= Theme.of(context).colorScheme;
  return OtpTextField(

    numberOfFields: 4,
    filled: true,

    cursorColor: color.onSurface,
    styles: [
      TextstyleConst.texts28.copyWith(fontWeight: FontWeight.w700),


      TextstyleConst.texts28.copyWith(fontWeight: FontWeight.w700),

      TextstyleConst.texts28.copyWith(fontWeight: FontWeight.w700),

      TextstyleConst.texts28.copyWith(fontWeight: FontWeight.w700),
    ],
    textStyle:TextstyleConst.texts16,
    enabledBorderColor: Colors.transparent,
    margin: EdgeInsets.symmetric(horizontal:5.w),
    borderColor: Colors.transparent,
    focusedBorderColor:color .onSurface,
    borderRadius: BorderRadius.circular(10.r),
   contentPadding: EdgeInsets.all(20.w),
    //set to true to show as box or false to show as dash
    showFieldAsBox: true,
    fillColor: color.secondary,
    //fieldHeight: 70.h,
    fieldWidth: 70.w,
    //runs when a code is typed in
    onCodeChanged: onsubmit,
    onSubmit:onsubmit

   // end onSubmit
  );
}
