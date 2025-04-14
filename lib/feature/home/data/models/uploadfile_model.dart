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
      "file": await MultipartFile.fromFile(
        file!.path,
        filename: basename(file!.path),
      ),
    };
  }
HomeModel.fromjson({required Map<String,dynamic>json})
{
  typefile=json['typefile'];
  rate=json['rate'];
}

  @override
  List<Object?> get props => [file, typefile];
}
