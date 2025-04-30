import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:truetone/core/utiles/app_colors.dart';

import '../../../../../core/utiles/app_assets.dart';

class HomeButtonAnimation extends StatelessWidget {
   HomeButtonAnimation({super.key,  required this.state});
   bool state ;

  @override
  Widget build(BuildContext context) {
    print(state);
    return RippleAnimation(
      child: CircleAvatar(
        minRadius: 80,
        maxRadius: 90,
        backgroundColor: AppColors.onprimary.withAlpha((255 * .2).toInt()),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            minRadius: 70,
            maxRadius: 80,
            backgroundColor: AppColors.onprimary,
            child:state? LoadingAnimationWidget.stretchedDots(
              color: AppColors.primarycolor,
              size: 50.w,
            ):null,
            backgroundImage:!state? AssetImage(homeimage):null,
          ),
        ),
      ),
      color: AppColors.onprimary,
      delay: const Duration(milliseconds: 300),
      repeat: true,
      minRadius: 100,
      maxRadius: 110,
      ripplesCount: 3,
      duration: const Duration(milliseconds: 6 * 300),
    );
  }
}
