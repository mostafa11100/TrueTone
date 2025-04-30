import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_colors.dart';

import '../../../../core/utiles/app_assets.dart';
import '../../../../core/utiles/app_textstyle.dart';

Widget eRrorHstoryWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 300.w, child: Image.asset(errorimage)),
        SizedBox(height: 10.h),
        Text(
          "Oops! The page you're looking for doesn't exist.",
          style: TextstyleConst.texts16.copyWith(fontWeight: FontWeight.w500,color: AppColors.onprimary),
        ),

      ],
    ),
  );
}
