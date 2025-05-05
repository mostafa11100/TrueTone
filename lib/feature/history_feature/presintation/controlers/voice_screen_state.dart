part of 'voice_screen_bloc.dart';

@immutable
sealed class VoiceScreenState {}

final class VoiceScreenInitial extends VoiceScreenState {}

final class Voicesucce extends VoiceScreenState {
  final Duration? duration;
  final Duration? durationplayed;
  final int? index;

  Voicesucce(this.duration, this.durationplayed, this.index);
}

final class Voiceloading extends VoiceScreenState {}

final class Voicedurationupdate extends VoiceScreenState {

  final Duration position;
  final Duration lngth;

  Voicedurationupdate(this.position,this.lngth);
}

final class VoiceButtonstate extends VoiceScreenState  {
  final bool play;

  VoiceButtonstate({this.play = false});
}

final class VoiceFail extends VoiceScreenState {
  final String error;

  VoiceFail(this.error);
}
