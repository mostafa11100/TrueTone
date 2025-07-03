part of 'create_new_password_procces_bloc.dart';

sealed class CreateNewPasswordProccesState {
  const CreateNewPasswordProccesState();
}

final class CreateNewPasswordProccesInitial
    extends CreateNewPasswordProccesState {}

final class CreateNewPasswordLoading extends CreateNewPasswordProccesState {}

final class CreateNewPasswordSuccess extends CreateNewPasswordProccesState {}

final class CreateNewPasswordSuccessnewpassword
    extends CreateNewPasswordProccesState {}

final class CreateNewPasswordFail extends CreateNewPasswordProccesState {
  final String error;
  CreateNewPasswordFail(this.error);
}
