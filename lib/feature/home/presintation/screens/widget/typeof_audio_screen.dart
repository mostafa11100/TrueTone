import 'package:flutter/cupertino.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/presintation/screens/widget/AiSoundpage.dart';
import 'package:truetone/feature/home/presintation/screens/widget/HumanSoundPage.dart';

class TypeofAudioScreen extends StatelessWidget {
  const TypeofAudioScreen({super.key, required this.result});
 final HomeEntity result;
  @override
  Widget build(BuildContext context) {
    return result.type=="Human"?HumanSoundPage(result: result,):AiSoundPage(result: result,) ;
  }
}
