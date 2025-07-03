// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart';

class HomeModel extends Equatable {
  File? file;
  String? typefile;
  String? rate;

  HomeModel(this.file);

  Future<Map<String, dynamic>> tojson() async {
    return {
      "SmallAudio": await MultipartFile.fromFile(
        file!.path,
        filename: basename(file!.path),
      ),
    };
  }

  HomeModel.fromjson({required Map<String, dynamic> json}) {
    print("------------------");
    //print("enter to model  and result ======= ${json}");
    typefile = json['result'];
    print("afterrrr type   $typefile");
    print(" confidat   ${json['confidence'].runtimeType}");
    print("------------------");
    rate = json['confidence'].toString();

    print("afterrrr ratee   $rate");
    print("afterrrr type   $typefile");
    print("after  get dataaaaa${typefile}  $rate");
  }

  @override
  List<Object?> get props => [file, typefile];
}
