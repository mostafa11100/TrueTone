import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart';

class HomeModel extends Equatable {
  File? file;
  String? typefile;
  double? rate;

  HomeModel(this.file);

  Future<Map<String, dynamic>> tojson() async {
    return {
        "AudioFile": await MultipartFile.fromFile(
        file!.path,
        filename: basename(file!.path),
      ),
    };
  }
HomeModel.fromjson({required Map<String,dynamic>json})
{
  print("enter to model  and result ======= ${json}");
  typefile=json['result'];
  rate=json['confidence'];
}

  @override
  List<Object?> get props => [file, typefile];
}
