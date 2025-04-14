import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

part 'voice_screen_event.dart';

part 'voice_screen_state.dart';

class VoiceScreenBloc extends Bloc<VoiceScreenEvent, VoiceScreenState> {
  late final AudioPlayer player;


  VoiceScreenBloc() : super(VoiceScreenInitial()) {
    on<InitPlayList>((event, emit) async {
      player = AudioPlayer();
      final ConcatenatingAudioSource playlist = await ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: List.generate(event.listofvoice.length, (i) {
          return AudioSource.uri(Uri.parse(event.listofvoice[i].url!));
        }),
      );
    });
      on<Seektopostion>((event, emit) async {
        try {
          int position = (event.position * 100).toInt();
          await player.seek(
              Duration(minutes: position), index: player.currentIndex);

          emit(Voicesucce(player.duration!,player.position,player.currentIndex!));
        } on PlayerException catch (e) {
          emit(VoiceFail("Error message: ${e.message}"));
        } on PlayerInterruptedException catch (e) {
          emit(VoiceFail("Connection aborted: ${e.message}"));
        } catch (e) {
          // Fallback for all other errors
          emit(VoiceFail('oop Unown error'));
        }
      });
    on<Stop>((event, emit) async {
      try {

        await player.stop(
           );

        emit(Voicesucce(player.duration!,player.position,player.currentIndex!));
      } on PlayerException catch (e) {
        emit(VoiceFail("Error message: ${e.message}"));
      } on PlayerInterruptedException catch (e) {
        emit(VoiceFail("Connection aborted: ${e.message}"));
      } catch (e) {
        // Fallback for all other errors
        emit(VoiceFail('oop Unown error'));
      }
    });
      on<PlayBefore>((event, emit) async
      {
        try {
          await player.seekToPrevious();
          emit(Voicesucce(player.duration!,player.position,player.currentIndex!));
        } on PlayerException catch (e) {
          emit(VoiceFail("Error message: ${e.message}"));
        } on PlayerInterruptedException catch (e) {
          emit(VoiceFail("Connection aborted: ${e.message}"));
        } catch (e) {
          // Fallback for all other errors
          emit(VoiceFail('oop Unown error'));
        }
      });
      on<PlayNext>((event, emit) async
      {

        try {
          await player.seekToNext();
          emit(Voicesucce(player.duration!,player.position,player.currentIndex!));
        } on PlayerException catch (e) {
          emit(VoiceFail("Error message: ${e.message}"));
        } on PlayerInterruptedException catch (e) {
          emit(VoiceFail("Connection aborted: ${e.message}"));
        } catch (e) {
          // Fallback for all other errors
          emit(VoiceFail('oop Unown error'));
        }
      });
      on<play>((event, emit) async {
        try {

          emit(Voicesucce(player.duration!,player.position,player.currentIndex!));
          await player.play();
        } on PlayerException catch (e) {
          emit(VoiceFail("Error message: ${e.message}"));
        } on PlayerInterruptedException catch (e) {
          emit(VoiceFail("Connection aborted: ${e.message}"));
        } catch (e) {
          // Fallback for all other errors
          emit(VoiceFail('oop Unown error'));
        }
      });
  }}