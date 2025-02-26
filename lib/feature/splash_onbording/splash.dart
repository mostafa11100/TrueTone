import 'package:flutter/material.dart';
import 'package:truetone/feature/splash_onbording/widget/splashbady.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Splashbady()),
    );
  }
}