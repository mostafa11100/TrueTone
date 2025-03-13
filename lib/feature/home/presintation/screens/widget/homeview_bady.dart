import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';

import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

class HomeviewBady extends StatefulWidget {
  const HomeviewBady({super.key});

  @override
  _HomeviewBadyState createState() => _HomeviewBadyState();
}

class _HomeviewBadyState extends State<HomeviewBady> {
  double _scale = 1.0;

  
  void _onImageTap() {

    setState(() {
      _scale = 0.8; 
    });

    
    Future.delayed(Duration(milliseconds: 200), () {
    
      GoRouter.of(context).push(AppRouts.loading);
      
      
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: GestureDetector(
            onTap: _onImageTap,  // Trigger the animation and navigation
            child: AnimatedScale(
              scale: _scale, 
              duration: Duration(milliseconds: 200), // Duration of the scale animation
              curve: Curves.easeInOut,  // Smooth animation curve
              child: Image.asset(homeimage),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            // Handle any additional functionality if needed
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Apptrings.hometitle,
                style: TextstyleConst.texts18.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.onprimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
