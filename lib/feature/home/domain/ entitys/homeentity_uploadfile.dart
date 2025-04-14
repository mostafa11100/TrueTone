import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable

{
  File? file;
  String?type;
  double?rate;
  HomeEntity({ this.file,this.type,this.rate});

  @override
  List<Object?> get props => [file];
}
