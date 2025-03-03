import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splashbady extends StatefulWidget {
  const Splashbady({super.key});

  @override
  State<Splashbady> createState() => _SplashbadyState();
}

class _SplashbadyState extends State<Splashbady> {

  @override
  void initState() {
   Future.delayed(Duration(seconds: 2),(){ GoRouter.of(context).push('/Onbording');});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/splash.png"),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}