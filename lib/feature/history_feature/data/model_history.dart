 import 'package:equatable/equatable.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

 class HsirotyResponseModel
 {
   List<HistoryModel>listofhistory=[];
   HsirotyResponseModel.fromjson({required Map<String,dynamic> js})
   {//update letter
     js['data'].forEach((v){listofhistory.add(HistoryModel.fromjson(js: v));});
   }
 }

class HistoryModel extends VoiceEntity
{
  HistoryModel({super.name,super.type,super.url});
  Map<String,dynamic>json={};
  HistoryModel.fromjson({required Map<String,dynamic> js})
  {
    name=js['name']??"";
    type=js['type']??"";
    url=js['url']??"";
  }
}
