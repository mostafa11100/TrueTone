part of 'voice_screen_bloc.dart';

@immutable
sealed class VoiceScreenEvent {}

class InitPlayList extends VoiceScreenEvent {
  List<VoiceEntity> listofvoice;
  int index;

  InitPlayList(this.listofvoice, this.index);
}

class SeekToindex extends VoiceScreenEvent {
  final int index;

  SeekToindex(this.index);
}

class Stop extends VoiceScreenEvent {}

class Seektopostion extends VoiceScreenEvent {
  final Duration position;

  Seektopostion(this.position);
}

class Changeposition extends VoiceScreenEvent {
  Duration position;

  Changeposition(this.position);
}

class PlayNext extends VoiceScreenEvent {}

class Pause extends VoiceScreenEvent {}

class PlayBefore extends VoiceScreenEvent {}
class PlayLoadingEvent extends VoiceScreenEvent {}

class PlayCompleltedEvent extends VoiceScreenEvent {}

class PlayRedayEvent extends VoiceScreenEvent {}

class PlayingEvent extends VoiceScreenEvent
{
  bool play;
  PlayingEvent(this.play);
}
