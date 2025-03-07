import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_assets.dart';

Widget signcollectionproviders(context,{Function()?  facebookfunction,Function()? googlfunction,Function()? applefunction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 15.w,
    children: [
      InkWell(onTap:facebookfunction ,child: circleofprovider(logofacebook,context)),
  InkWell(onTap:googlfunction,child: circleofprovider(logogoogle,context)),
  InkWell(onTap:applefunction,child: circleofprovider(logoapple,context
  )),
    ],
  );
}

Widget circleofprovider(logo,context) {
  return Container(
    height: 70.h,width: 70.w,
    decoration: BoxDecoration(color:  Colors.transparent,shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary)),

    child: Center(child: Image.asset(logo, fit: BoxFit.cover)),
  );
}
