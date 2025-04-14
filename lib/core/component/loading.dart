import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_colors.dart';

import '../utiles/app_assets.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LoadingAnimationWidget.stretchedDots(
            color: AppColors.primarycolor,
            size: 110.w,
          ),
        ),
      ),
    );
  }
}

showloadingdialog(context)

{
  showDialog(context: context, builder: (BuildContext context)

  {
    return AlertDialog(content:  Loadingscreen());
  },);
}
