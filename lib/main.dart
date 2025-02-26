import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/utiles/theams.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const TrueTone());
}

class TrueTone extends StatelessWidget {
  const TrueTone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: Thems.darktheme(),
          theme: Thems.lighttheme(),
          themeMode: ThemeMode.dark,
          routerConfig: routers,
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
