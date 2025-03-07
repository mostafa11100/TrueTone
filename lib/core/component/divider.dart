import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

Widget cutomdivider(context, {text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 5.w,
    children: [
      Flexible(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).colorScheme.onSecondary,),
          height: 2.1,

        ),
      ),
      Flexible(child:
      Text(text, style: TextstyleConst.texts14.copyWith(fontWeight: FontWeight.w600),maxLines: 1,)),

      Flexible(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).colorScheme.onSecondary,),
          height: 2.1,

        ),
      ),
    ],
  );
}
