import 'package:flutter/material.dart';
import 'package:truetone/feature/home/presintation/screens/widget/homeview_bady.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      body: SafeArea(child: HomeviewBady()),
    );
  }
}
