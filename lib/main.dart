import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/helper/shared_pref.dart';
import 'package:truetone/core/helper/uploade_files_helper.dart';
import 'package:truetone/core/utiles/theams.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  final supabase = Supabase.instance.client;
  final uploader = MediaUploader(supabase, "media-uploads", "anonymous");



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
