import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/component/loading.dart';
import 'package:truetone/core/network/api_server.dart';
import 'package:truetone/core/helper/shared_pref.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/controler/create_new_password_procces_bloc.dart';
import 'package:truetone/feature/auth/signin/presintation/controler/signin_cubit.dart';
import 'package:truetone/feature/auth/signin/presintation/screens/signin_screen.dart';
import 'package:truetone/feature/auth/verify_email/presintaion/screens/verify_emal_screen.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/screens/history_screen.dart';
import 'package:truetone/feature/history_feature/presintation/screens/voice_playe_screen.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/presintation/screens/widget/AiSoundpage.dart';
import 'package:truetone/feature/setting/date/model.dart';
import 'package:truetone/feature/setting/presintation/screens/eddit_profile.dart';
import 'package:truetone/feature/setting/presintation/screens/language.dart';
import 'package:truetone/feature/setting/presintation/screens/settinghome.dart';

import 'package:truetone/feature/splash_onbording/onbording.dart';
import 'package:truetone/feature/splash_onbording/splash.dart';
import 'package:truetone/mainScreen.dart';

import '../../feature/auth/forgetpassword/presintation/screens/createnewpassword_processcreeen.dart';
import '../../feature/auth/signup/presintation/controler/cubit/sign_up_cubit.dart';
import '../../feature/auth/signup/presintation/screens/signup_screen.dart';
import '../../feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import '../../feature/history_feature/presintation/widgets/blocvalue_widget.dart';
import '../../feature/home/presintation/screens/widget/typeof_audio_screen.dart';
import '../di/si.dart';

class AppRouts {
  static String splashscreen = "/";

  static String setting1 = "/EditProfileScreen";

  static String onbording = "/onbording";

  static String signin = "/signin";

  static String signup = "/signup";
  static String app_home = "/app";
  static String verifyemalScreen = "/verifyemail";
  static String forgetpassword = "/forgetpassword";
  static String loading = "/loading";
  static String mainscreen = "/mainscreen";
  static String SettingsScreen2 = "/SettingsScreen";
  static String voicescreen = "/voicescreen";
  static String typeaudioscreen = "/typeaudioscreen";
  static String history = "/history";
  

  static GoRouter routs = GoRouter(
    initialLocation:splashscreen,
    redirect: (context, state) {
      if (state.fullPath == onbording) {
        bool visit = sl<Cashhelper>().gituservisit() ?? false;

        if (visit) {
          bool login = sl<Cashhelper>().getuserlogin() ?? false;
          return login ? signin : signin;
        } else {
          sl<Cashhelper>().setvisit();
        }
      }
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
        path: loading,
        builder: (context, state) {
          return Loadingscreen();
        },
      ),
      GoRoute(
        path: mainscreen,
        builder: (context, state) {
          return Mainscreen();
        },
      ),
      GoRoute(
        path: voicescreen,
        builder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final dynamic bloc = extra['bloc'] as VoiceScreenBloc;
          List<VoiceEntity> voice = extra['voices'];
          int index = extra['index'];
          return BlocProvider.value(
            value: bloc,
            child: VoiceScreenBlocValue(
              voices: voice,
              bloc: bloc,
              index: index,
            ),
          );
        },
      ),
      GoRoute(
        path: typeaudioscreen,
        builder: (context, state) {
          return TypeofAudioScreen(result: state.extra as HomeEntity);
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

     GoRoute(
  path: setting1,
  builder: (context, state) {
    final profile = state.extra as UserProfile;
    return EditProfileScreen(profile: profile,);
  },
),
   
    ],
  );

  //   static GoRouter routs = GoRouter(routes: []);
}
