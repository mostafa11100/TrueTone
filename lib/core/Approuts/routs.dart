import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/component/loading.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/controler/create_new_password_procces_bloc.dart';
import 'package:truetone/feature/auth/signin/presintation/controler/signin_cubit.dart';
import 'package:truetone/feature/auth/signin/presintation/screens/signin_screen.dart';
import 'package:truetone/feature/auth/verify_email/presintaion/screens/verify_emal_screen.dart';
import 'package:truetone/feature/home/presintation/screens/home_views.dart';
import 'package:truetone/feature/home/presintation/screens/widget/AiSoundpage.dart';
import 'package:truetone/feature/home/presintation/screens/widget/HumanSoundPage.dart';

import 'package:truetone/feature/splash_onbording/onbording.dart';
import 'package:truetone/feature/splash_onbording/splash.dart';
import 'package:truetone/mainScreen.dart';

import '../../feature/auth/forgetpassword/presintation/screens/createnewpassword_processcreeen.dart';
import '../../feature/auth/signup/presintation/controler/cubit/sign_up_cubit.dart';
import '../../feature/auth/signup/presintation/screens/signup_screen.dart';
import '../di/si.dart';

class AppRouts {
  static String splashscreen = "/ss";

  static String onbording = "/onbording";

  static String signin = "/signin";
  static String HomeViews1 = "/s";
  static String  Mainscreen1='/';
  static String signup = "/signup";
  static String app_home = "/app_home";
  static String verifyemalScreen = "/verifyemail";
  static String forgetpassword="/forgetpassword";
  static String Loading = "/Loading";
      static String HumanSoundPage1 = "/HumanSoundPage";
       static String aiSoundPage1 = "/AiSoundPage";
  static GoRouter routs = GoRouter(
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: splashscreen,
        builder: (context, state) {
          return Splashscreen();
        },
      ),
       GoRoute(
        path:Loading ,
        builder: (context, state) {
          return Loadingscreen();
        },
      ),
      GoRoute(
        path:Mainscreen1,
        builder: (context, state) {
          return Mainscreen();
        },
      ),
       GoRoute(
        path:HumanSoundPage1,
        builder: (context, state) {
          return HumanSoundPage();
        },
      ),
        GoRoute(
        path:aiSoundPage1,
        builder: (context, state) {
          return AiSoundPage();
        },
      ),
      GoRoute(
        path: onbording,
        builder: (context, state) {
          return Onbording();
        },
      ),

      GoRoute(
        path: signup,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<SignUpCubit>(),
            child: SignupScreen(),
          );
        },
      ),

      GoRoute(
        path: signin,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<SigninCubit>(),
            child: SigninScreen(),
          );
        },
      ),

      GoRoute(
        path: verifyemalScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<CreateNewPasswordProccesBloc>(),
            child: VerifyEmalScreen(email: "mostafa@gmail.com"),
          );
        },
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<CreateNewPasswordProccesBloc>(),
            child: CreatenewpasswordProcesscreeen(),
          );
        },
      ),
      
    ],
  );

  //   static GoRouter routs = GoRouter(routes: []);
}
