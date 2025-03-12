part of 'voice_screen_bloc.dart';

@immutable
sealed class VoiceScreenEvent {}
class InitPlayList extends VoiceScreenEvent
{
 List<VoiceEntity>listofvoice;
 InitPlayList(this.listofvoice);
}
class play extends VoiceScreenEvent {}
class Stop extends VoiceScreenEvent {}


class Seektopostion extends VoiceScreenEvent {
 final double position;

  Seektopostion(this.position);
}

class PlayNext extends VoiceScreenEvent {}
class Pause extends VoiceScreenEvent {}

class PlayBefore extends VoiceScreenEvent {}
