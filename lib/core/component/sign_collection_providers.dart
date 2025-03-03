import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_assets.dart';

Widget signcollectionproviders() {
  return Row(
    spacing: 10.w,
    children: [
      circleofprovider(logofacebook),
      circleofprovider(logogoogle),
      circleofprovider(logoapple),
    ],
  );
}

Widget circleofprovider(logo) {
  return CircleAvatar(
    backgroundColor: Colors.transparent,

    radius: 30.r,
    child: Center(child: Image.asset(logo, fit: BoxFit.cover)),
  );
}
