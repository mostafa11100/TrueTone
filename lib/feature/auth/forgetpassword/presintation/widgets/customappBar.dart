
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utiles/app_textstyle.dart';

customAppBar(context,
    text
    )
{
  return AppBar(
    leadingWidth: 70.w,
    leading: Padding(
      padding:  EdgeInsets.all(10.0.w),
      child: CircleAvatar(
        radius: 12.r,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.arrow_back_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
    title: Text(
      text,
      style: TextstyleConst.texts22.copyWith(fontWeight: FontWeight.w600),
    ),
  );
}
