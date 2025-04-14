part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState

{
  HomeEntity entity;
  HomeSuccess(this.entity);
}

final class HomeFail extends HomeState
{
  String error;
  HomeFail(this.error);
}

