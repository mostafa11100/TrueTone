import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/utiles/theams.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const TrueTone());
}

class TrueTone extends StatelessWidget {
  const TrueTone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          darkTheme: Thems.darktheme(),
          theme: Thems.lighttheme(),
          themeMode: ThemeMode.light,
          routerConfig: AppRouts.routs,
          debugShowCheckedModeBanner: false,
          //3:16
          // localizationsDelegates: [
          //         S.delegate,
          //         GlobalMateialLocalizations.delegate,
          //         GlobalWidgetsLocalizations.delegate,
          //         GlobalCupertinoLocalizations.delegate,
          //     ],
          //      supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
