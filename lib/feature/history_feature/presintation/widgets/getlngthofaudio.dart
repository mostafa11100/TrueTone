
import 'package:just_audio/just_audio.dart';

Future<int> getlngthaudio(url)async

{
  final player = AudioPlayer();
  await player.setUrl(url);
  final duration = player.duration;
  return duration!.inMinutes;

}
