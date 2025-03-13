part of 'voice_screen_bloc.dart';

@immutable
sealed class VoiceScreenState {}

final class VoiceScreenInitial extends VoiceScreenState {}
final class Voicesucce extends VoiceScreenState
{
 final Duration duration;
 final Duration durationplayed;
int  index;
  Voicesucce(this.duration,this.durationplayed,this.index);
}

final class Voiceloading extends VoiceScreenState {}

final class VoiceFail extends VoiceScreenState
{
  String error;
  VoiceFail(this.error);
}
