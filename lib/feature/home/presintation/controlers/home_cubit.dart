import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/home/data/mapers/convert_to_home_models.dart';
import 'package:truetone/feature/home/data/models/uploadfile_model.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/domain/usecases/check_audio_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  UsecaseCheckAudio _usecaseCheckAudio;

  HomeCubit(this._usecaseCheckAudio) : super(HomeInitial());
  static HomeCubit blocprovider(context) {
    return BlocProvider.of<HomeCubit>(context);
  }

  checkaudio({required HomeEntity entity}) async {
    emit(HomeLoading());
    try {
      Either<Failure, HomeModel> result = await _usecaseCheckAudio.excute(
        entity,
      );
      result.fold(
        (left) {
          print("enter to cubit  send voice errrror ${left.error}");
          emit(HomeFail(left.error!));
        },
        (right) {
          print("enter to cubit  send voice  success sended ");
          emit(HomeSuccess(right.tohomeentity()));
        },
      );
    } catch (e) {
      print("enter to cubit  send voice catch error ${e.toString()}");
      emit(HomeFail(e.toString()));
    }
  }
}
