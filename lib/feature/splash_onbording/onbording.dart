import 'package:flutter/material.dart';

import 'package:truetone/feature/splash_onbording/widget/onbordingbady.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:Onbordingbady()),
    );
  }
}