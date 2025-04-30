import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheet.dart';

AppBar customabbBarvoicescreen(context)
{return  AppBar(
  leadingWidth: 70.w,
  leading: Padding(
    padding: EdgeInsets.all(10.0.w),
    child: CircleAvatar(
      radius: 12.r,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Icon(
        Icons.arrow_back_outlined,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withAlpha((.9 * 255).toInt()),
      ),
    ),
  ),
  actions: [
    InkWell(
      onTap: () {
        custom_bottomsheet(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Icon(
          Icons.more_horiz_outlined,
          size: 28.r,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
    SizedBox(height: 8.h),
  ],
);}