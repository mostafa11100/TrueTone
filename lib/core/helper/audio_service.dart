import 'package:dartz/dartz.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

class AudioService {
  late AudioPlayer player;

  Future<Either<Failure, Duration>> initplaylist({
    required List<VoiceEntity> listofvoice,
    required int index,
    Function(Duration d)? listenfunction,
   required Function() playing,
    required Function() stop,
    required Function() completed,
    required Function() loading,
    required Function() ready,
  }) async {
    try {
      player = AudioPlayer();
      final ConcatenatingAudioSource playlist = await ConcatenatingAudioSource(
        useLazyPreparation: false,
        shuffleOrder: DefaultShuffleOrder(),
        children: List.generate(listofvoice.length, (i) {
          return AudioSource.uri(Uri.parse(listofvoice[i].url!));
        }),
      );
      Duration? duration = await player.setAudioSource(
        playlist,
        initialIndex: index,
      );
      await player.playerStateStream.listen((state) async {
        final isPlaying = state.playing;
        final isPaused =
            !state.playing && state.processingState == ProcessingState.ready;
        final isCompleted = state.processingState == ProcessingState.completed;
        final isready = state.processingState == ProcessingState.ready;
        final islodng = state.processingState == ProcessingState.buffering;

        if (isPlaying) {
          playing();
        }
        if (isPaused) {
          stop();
        }
        if (isCompleted) {
          completed();
          //  change ui
        }
        if (isready) {
          ready();
        }
        if (islodng) {
          loading();
        }
      });

      await player.positionStream.listen((d) async {
        listenfunction!(d);
        print("possssiton ==${d.inSeconds}");
        if(d.inSeconds==player.duration!.inSeconds)
          {
            print("✅ الصوت انتهاااااااااا");
            await player.pause();
            await player.seek(Duration.zero);

            completed();
          }
      });
      return Right(duration ?? Duration.zero);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror(e.toString()));
    }
  }

  Future<Either<Failure, Duration>> seektoposition({
    required Duration position,
  }) async {
    try {
      await player.seek(
        position,
        index: player.currentIndex,
      );
      return Right(player.position);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }

  Future<Either<Failure, Unit>> stop() async {
    try {

      await player.pause();
      return Right(unit);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }

  Future<Either<Failure, Duration>> playbefore() async {
    try {
      await player.seekToPrevious();
      return Right(player.duration!);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }

  Future<Either<Failure, Duration>> playnext() async {
    try {
      if (player.playing || player.sequenceState != null) {

        await player.seekToNext();
      } else {
        return Left(Failure.firbaseeror("Player is not ready yet"));
      }
      return Right(player.duration!);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }

  Future<Either<Failure, Duration>> seektoindex({required int index}) async {
    try {
      if (player.playing || player.sequenceState != null) {
        player.pause();
        await player.seek(Duration.zero, index: index);
      } else {
        return Left(Failure.firbaseeror("Player is not ready yet"));
      }
     
      return Right(player.duration!);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {

      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }

  Future<Either<Failure, Unit>> play() async {
    try {
      // if (player.processingState == ProcessingState.ready&&!player.playing)
      // {

      await player.stop();
        await player.play();
      // }

      return Right(unit);
    } on PlayerException catch (e) {
      return Left(Failure.firbaseeror("Error message: ${e.message}"));
    } on PlayerInterruptedException catch (e) {
      return Left(Failure.firbaseeror("Connection aborted: ${e.message}"));
    } catch (e) {
      // Fallback for all other errors
      return Left(Failure.firbaseeror('${e.toString()}'));
    }
  }
}
