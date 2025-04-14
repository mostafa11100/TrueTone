part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistorySuccessFetch extends HistoryState {
  List<VoiceEntity> listofhistory = [];

  HistorySuccessFetch(this.listofhistory);
}

final class HistoryDeleteSuccess extends HistoryState {}

final class HistoryFail extends HistoryState {
 final String error;

  HistoryFail(this.error);
}
