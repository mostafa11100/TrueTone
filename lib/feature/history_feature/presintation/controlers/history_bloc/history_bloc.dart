import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/Failure.dart';
import '../../../data/model_history.dart';
import '../../../domain/entitys/voice_entity.dart';
import '../../../domain/history_interface.dart';
import '../../../domain/usecases/histor_usecase_fetch.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  BaseHistoryRepo _baseHistoryRepo;
  late UseCaseHistoryfitch _useCaseHistoryfitch;
  late UseCaseDelete _useCaseDelete;

  HistoryBloc(this._baseHistoryRepo) : super(HistoryInitial()) {
    on<FetchHistoryEvent>((event, emit) async {
      try {
        _useCaseHistoryfitch = UseCaseHistoryfitch(_baseHistoryRepo);
        emit(HistoryLoading());
        Either<Failure, List<VoiceEntity>> rslt = await _useCaseHistoryfitch
            .excute(data: HsirotyResponseModel());
        rslt.fold(
          (left) {
            emit(HistoryFail(left.error!));
          },
          (right) {
            emit(HistorySuccessFetch(right));
          },
        );
      } catch (e) {
        emit(HistoryFail(Failure.gineralerror(e.toString()).error!));
      }
    });
    //
    on<DeleteHistory>((event, emit) async {
      _useCaseDelete = UseCaseDelete(_baseHistoryRepo);
      emit(HistoryLoading());
      Either<Failure, Unit> rslt = await _useCaseDelete.excute(
        data: event.voiceEntity,
      );
      rslt.fold(
        (left) {
          emit(HistoryFail(left.error!));
        },
        (right) {
          emit(HistoryDeleteSuccess());
          add(FetchHistoryEvent());
        },
      );
      add(FetchHistoryEvent());
    });
  }
}
