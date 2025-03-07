
import
'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:truetone/core/error/Failure.dart';
import '../../../domain/entitys/signup_entity.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signupUsecase) : super(SignUpInitial());

  final SignupUsecase _signupUsecase;
  excute({email, password}) async {
    emit(SignUpLoading());
    Either<Failure, Unit> result = await _signupUsecase.signup(
      signupentity: SignUpEntity(email: email, password: password),
    );
    result.fold(
      (left) {
        emit(SignUpFail(left.error!));
      },
      (_) {
        emit(SignUpSucces());
      },
    );
  }
}
