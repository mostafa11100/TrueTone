
import 'package:just_audio/just_audio.dart';

Future<String> getlngthaudio(url)async

{

  final player = AudioPlayer();
  await player.setUrl(url);
  final duration = player.duration;
if(duration!=null) {
  int s = duration.inSeconds % 60;
  int m = duration.inMinutes;
  String inm = m.toString().padLeft(2, '0');
  String ins = s.toString().padLeft(2, '0');
  // if(seconds<60)
  //   {
  //     return seconds.toDouble();
  //   }

  return inm + ":" + ins;
}return "00:00";
}
