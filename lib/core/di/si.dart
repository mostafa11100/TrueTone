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
import 'package:truetone/feature/history_feature/domain/history_interface.dart';

import '../../feature/auth/forgetpassword/data/remote_passwordprocess.dart';
import '../../feature/auth/forgetpassword/data/repo_imp/password_procees_repo_imp.dart';
import '../../feature/auth/signup/presintation/controler/cubit/sign_up_cubit.dart';
import '../../feature/history_feature/data/remote/history_remoteprocces.dart';
import '../../feature/history_feature/data/repo_imp/repo_imp_fetchhistory.dart';
import '../../feature/history_feature/presintation/controlers/history_bloc/history_bloc.dart';
import '../../feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import '../../feature/home/data/remote/remote_home.dart';
import '../../feature/home/data/repo_imp/home_repo_imp.dart';
import '../../feature/home/domain/usecases/check_audio_usecase.dart';
import '../../feature/home/presintation/controlers/home_cubit.dart';

final sl = GetIt.instance;

setupLocator() {
  sl.registerSingleton<DioNetwork>(DioNetwork.init());

  sl.registerSingletonAsync<Cashhelper>(()async
  {
    return await Cashhelper.chachhelperinit();
  });

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
    return VoiceScreenBloc();
  });
  sl.registerFactory(() {
    return HistoryBloc(FetchHistoryRepo(RemoteHistory()));
  });
  sl.registerFactory(() {
    return HomeCubit(
      UsecaseCheckAudio(HomeCheckFileTypeRepo(HomeRemoteUploadFile())),
    );
  });
}
