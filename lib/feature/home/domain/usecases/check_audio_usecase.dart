import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/home/data/models/uploadfile_model.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/domain/interfaces/home_interface.dart';

class UsecaseCheckAudio {
  HomeInterface _homeInterface;

  UsecaseCheckAudio(this._homeInterface);

  Future<Either<Failure, HomeModel>>  excute(HomeEntity homeentity) async {
    Either<Failure, HomeModel> result = await _homeInterface.checkaudiotype(
      homeentity: homeentity,
    );
   return result;
  }
}
