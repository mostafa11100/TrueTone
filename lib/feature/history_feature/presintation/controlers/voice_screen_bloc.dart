import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../../../../core/helper/audio_service.dart';

part 'voice_screen_event.dart';

part 'voice_screen_state.dart';

class VoiceScreenBloc extends Bloc<VoiceScreenEvent, VoiceScreenState> {
  late AudioService audioService;
  bool intializd = false;

  VoiceScreenBloc() : super(VoiceScreenInitial()) {
    on<InitPlayList>((event, emit) async {
      emit(Voiceloading());
      try {
        if (intializd == false) {
          audioService = AudioService();
          intializd = true;
          Either<Failure, Duration> result = await audioService.initplaylist(
            listofvoice: event.listofvoice,
            index: event.index,
            listenfunction: (d) {
              print(audioService.player.duration!.inSeconds);
              add(Changeposition(d));
            },
            playing: () {
              add(PlayingEvent(true));
            },
            stop: () {
              add(PlayingEvent(false));
            },
            completed: () {
              add(PlayCompleltedEvent());
            },
            loading: () {
              add(PlayLoadingEvent());
            },
            ready: () {
              // add(PlayRedayEvent());
            },
          );
          result.fold(
            (left) {
              emit(VoiceFail(left.error!));
            },
            (right) {
              emit(
                Voicesucce(
                  right,
                  Duration.zero,
                  audioService.player.currentIndex,
                ),
              );
            },
          );
        } else {
          Either<Failure, Duration> result = await audioService.seektoindex(
            index: event.index,
          );
          result.fold(
            (left) {
              emit(VoiceFail(left.error!));
            },
            (right) {
              print("in  seeeeeeeeek${right.inSeconds}");
              Voicesucce(
                right,
                Duration.zero,
                audioService.player.currentIndex,
              );
            },
          );
        }
      } catch (e) {
        emit(VoiceFail(Failure.firbaseeror(e.toString()).error!));
      }
    });
    on<Changeposition>((event, emit) {
      emit(Voicedurationupdate(event.position,audioService.player.duration!));
    });
    on<Seektopostion>((event, emit) async {
      emit(Voiceloading());
      Either<Failure, Duration> result = await audioService.seektoposition(
        position: event.position,
      );
      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
     //     emit(
            // Voicesucce(
            //   Duration(
            //     seconds:
            //         audioService.player.duration!.inSeconds - right.inSeconds,
            //   ),
    //          right,
  //            audioService.player.currentIndex,
//            ),
        //  );
        },
      );
    });
    on<Stop>((event, emit) async {
      Either<Failure, Unit> result = await audioService.stop();
      emit(VoiceButtonstate(play: false));

      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
          emit(VoiceButtonstate());
        },
      );
    });
    on<PlayBefore>((event, emit) async {
      Either<Failure, Duration> result = await audioService.playbefore();

      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
          emit(
            Voicesucce(
              right,
              audioService.player.position,
              audioService.player.currentIndex,
            ),
          );
        },
      );
    });
    on<PlayNext>((event, emit) async {
      emit(Voiceloading());
      Either<Failure, Duration> result = await audioService.playnext();
      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
          emit(
            Voicesucce(right, Duration.zero, audioService.player.currentIndex),
          );
        },
      );
    });
    on<SeekToindex>((event, emit) async {
      emit(Voiceloading());

      Either<Failure, Duration> result = await audioService.seektoindex(
        index: event.index,
      );
      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
          emit(
            Voicesucce(right, Duration.zero, audioService.player.currentIndex),
          );
        },
      );
    });

    on<Pause>((event, emit) async {
      Either<Failure, Unit> result = await audioService.play();

      result.fold(
        (left) {
          emit(VoiceFail(left.error!));
        },
        (right) {
          emit(VoiceButtonstate(play: true));
        },
      );
    });
    on<PlayingEvent>((event, emit) {
      emit(VoiceButtonstate(play: event.play));
    });
    on<PlayCompleltedEvent>((event, emit) {
      if (audioService.player.playing)
        emit(VoiceButtonstate(play: true));
      else
        emit(VoiceButtonstate(play: false));
    });
    on<PlayLoadingEvent>((event, emit) {
      emit(Voiceloading());
    });
  }
}
