import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/Failure.dart';
import '../../domain/entitys/signin_entity.dart';
import '../../domain/signinusecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._baseSigninusecase) : super(SigninInitial());
  SigninUseCase<Unit> _baseSigninusecase;

  static SigninCubit  blocbrovider(context)
  {return BlocProvider.of<SigninCubit>(context);}

  Future<void> axcute({email, password}) async {
try {
  emit(SigninLoading());
  Either<Failure, Unit> result = await _baseSigninusecase.excute(
    SignInEntity(email: email, password: password),
  );
  result.fold((left) {
    print("oops error in left ${left.error}");
    emit(SigninFail(left.error!));
  }, (_) {
    print("success}");
    emit(SigninSuccess());
  });
}catch(e)
    {print("oops error ${e.toString()}");}
  }
}
