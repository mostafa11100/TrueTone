part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class FetchHistoryEvent extends HistoryEvent {}

class DeleteHistory extends HistoryEvent

{
  VoiceEntity voiceEntity;
  DeleteHistory(this.voiceEntity);
}
