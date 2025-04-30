import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_colors.dart';

import '../../../../core/utiles/app_assets.dart';
import '../../../../core/utiles/app_textstyle.dart';

Widget eMptyHistory() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 300.w, child: Image.asset(emptyhistry)),
        SizedBox(height: 20.h),
        Text(
          "Empty Floder",
          style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w700,color: AppColors.onprimary),
        ),
        SizedBox(height: 8.h),
        Opacity(opacity: .5,
          child: Text(
            "Start uploading files",
            style: TextstyleConst.texts16.copyWith(fontWeight: FontWeight.w500,color: AppColors.onprimary),
          ),
        ),
      ],
    ),
  );
}
