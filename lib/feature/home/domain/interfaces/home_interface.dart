import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/home/data/models/uploadfile_model.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';

abstract class HomeInterface

{
 Future<Either<Failure,HomeModel>> checkaudiotype({HomeEntity? homeentity});
}