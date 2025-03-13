import 'package:get_it/get_it.dart';
import 'package:truetone/core/helper/shared_pref.dart';
import 'package:truetone/core/network/api_dio.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/controler/create_new_password_procces_bloc.dart';
import 'package:truetone/feature/auth/signin/data/remote/remote_signin.dart';
import 'package:truetone/feature/auth/signin/data/repo_imp/signin_repo.dart';
import 'package:truetone/feature/auth/signin/domain/signinusecase.dart';
import 'package:truetone/feature/auth/signin/presintation/controler/signin_cubit.dart';
import 'package:truetone/feature/auth/signup/data/remote_datasource/signup_remote.dart';
import 'package:truetone/feature/auth/signup/data/repo_imp/signup_repo_imp.dart';
import 'package:truetone/feature/auth/signup/domain/usecases/signup_usecase.dart';

import '../../feature/auth/forgetpassword/data/remote_passwordprocess.dart';
import '../../feature/auth/forgetpassword/data/repo_imp/password_procees_repo_imp.dart';
import '../../feature/auth/signup/presintation/controler/cubit/sign_up_cubit.dart';
import '../../feature/history_feature/presintation/controlers/voice_screen_bloc.dart';

final sl = GetIt.instance;

setupLocator() {
  sl.registerSingleton<DioNetwork>(DioNetwork.init());

  sl.registerSingleton<Cashhelper>(Cashhelper());

  sl.registerFactory(() {
    return SignUpCubit(SignupUsecase(SignupRepoImp(SignupRemote())));
  });

  sl.registerFactory(() {
    return SigninCubit(SigninUseCase(SigninRepo(RemoteSignin())));
  });

  sl.registerFactory(() {
    return CreateNewPasswordProccesBloc(
      PasswordProccesImp(RemotePasswordProcces()),
    );

  });
  sl.registerFactory(() {
    return VoiceScreenBloc(
    );});
}
