import 'package:go_router/go_router.dart';

import 'package:truetone/features/auth/signup/presintation/screens/signup_screen.dart';
import 'package:truetone/feature/splash_onbording/onbording.dart';
import 'package:truetone/feature/splash_onbording/splash.dart';

// class AppRouts {
//   static String splashscreen = "/";

//   static String onbording = "/onbording";

//   static String signin = "/signin";

//   static String signup = "/signup";

  static GoRouter routs = GoRouter(
    redirect: (context, state) {},
    routes: [
      GoRoute(
        path: signup,
        builder: (context, state) {
          return SignupScreen();
        },
      ),
    ],
  );

//   static GoRouter routs = GoRouter(routes: []);
// }

final routers = GoRouter(
  
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => splashscreen(),
    ),
     GoRoute(
      path: '/Onbording',
      builder: (context, state) => Onbording(),
    ),
  ],
);

