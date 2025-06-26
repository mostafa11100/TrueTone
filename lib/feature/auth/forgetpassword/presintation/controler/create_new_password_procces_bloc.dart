import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:truetone/feature/auth/forgetpassword/domain/interfacess/password_procces_interface.dart';

import '../../../../../core/error/Failure.dart';
import '../../domain/usecases/verifyemail_usecase.dart';

part 'create_new_password_procces_event.dart';

part 'create_new_password_procces_state.dart';

class CreateNewPasswordProccesBloc
    extends Bloc<CreateNewPasswordProccesEvent, CreateNewPasswordProccesState> {
  BasePasswordProccess<Unit> _basePasswordProccess;
  late VerifyEmailUseCase _verifyEmailUseCase;

  late CheckOtpUseCase _checkOtpUseCase;
  late CreateNewPasswordUseCase _createNewPasswordUseCase;

  CreateNewPasswordProccesBloc(this._basePasswordProccess)
    : super(CreateNewPasswordProccesInitial()) {
    on<SendOTP>((event, emit) async {
      emit(CreateNewPasswordLoading());
      _verifyEmailUseCase = VerifyEmailUseCase(_basePasswordProccess);
      Either<Failure, Unit> result = await _verifyEmailUseCase.excute(
        event.email,
      );
      result.fold(
        (left) {
          emit(CreateNewPasswordFail(left.error!));
        },
        (_) {
          emit(CreateNewPasswordSuccess());
        },
      );
    });
    on<VerifyOTP>((event, emit) async {
      _checkOtpUseCase = CheckOtpUseCase(_basePasswordProccess);
      emit(CreateNewPasswordLoading());
      Either<Failure, Unit> result = await _checkOtpUseCase.excute(event.otp);
      result.fold(
        (left) {
          emit(CreateNewPasswordFail(left.error!));
        },
        (_) {
          emit(CreateNewPasswordSuccess());
        },
      );
    });
    on<NewPassword>((event, emit) async {
      _createNewPasswordUseCase = CreateNewPasswordUseCase(
        _basePasswordProccess,
      );
      emit(CreateNewPasswordLoading());
      Either<Failure, Unit> result = await _createNewPasswordUseCase.excute(
        event.password,
      );
      result.fold(
        (left) {
          emit(CreateNewPasswordFail(left.error!));
        },
        (_) {
          emit(CreateNewPasswordSuccessnewpassword());
        },
      );
    });
  }
}
