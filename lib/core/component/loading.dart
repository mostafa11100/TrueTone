import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_assets.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}


class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
Future.delayed(Duration(seconds: 2),(){
  GoRouter.of(context).push(AppRouts.aiSoundPage1);}
  );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(loading1)
      ),
    );
  }
}