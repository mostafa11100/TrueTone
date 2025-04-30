import 'package:equatable/equatable.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

class HsirotyResponseModel {
  List<HistoryModel> listofhistory = [];

  HsirotyResponseModel() {}

  Map<String, dynamic> tojson({voiceid}) {
    return voiceid != null ? {"voiceid": voiceid} : {};
  }

  HsirotyResponseModel.fromjson({required List lst}) {
    lst.forEach((v) {
      listofhistory.add(HistoryModel.fromjson(js: v));
    });
    //update letter
  }
}

class HistoryModel extends VoiceEntity {
  HistoryModel({super.name, super.type, super.url});

  Map<String, dynamic> json = {};

  HistoryModel.fromjson({required Map<String, dynamic> js}) {
    name = js['id'].toString() ;
    type = js['result'] ?? "";
    url = js['audioFilePath'] ?? "";
  }
}
