import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/signinusecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._baseSigninusecase) : super(SigninInitial());
  SigninUseCase<Unit> _baseSigninusecase;

  static SigninCubit  blocbrovider(context)
  {return BlocProvider.of<SigninCubit>(context);}

  Future<void> axcute({email, password}) async {

   // emit(SigninLoading());
    // Either<Failure, Unit> result = await _baseSigninusecase.excute(
    //   SignInEntity(email: email, password: password),
    // );
    // result.fold((left) {emit(SigninFail(left.error!));}, (_) {
       emit(SigninSuccess());
    // });

  }
}
