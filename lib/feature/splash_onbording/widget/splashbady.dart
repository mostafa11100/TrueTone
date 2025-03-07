import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_assets.dart';

class Splashbady extends StatefulWidget {
  const Splashbady({super.key});

  @override
  State<Splashbady> createState() => _SplashbadyState();
}

class _SplashbadyState extends State<Splashbady> {

  @override
  void initState() {
   Future.delayed(Duration(seconds: 2),(){ GoRouter.of(context).push(AppRouts.onbording);});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(splasset),
          SizedBox(height: 40.h,)
        ],
      ),
    );
  }
}