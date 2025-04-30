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
    playing,
    stop,
    completed,
    loading,
    ready,
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
          print("🎵 الصوت شغال");
          playing;
        }
        if (isPaused) {
          print("⏸️ الصوت متوقف مؤقتاً");
          stop;
        }
        if (isCompleted) {
          print("✅ الصوت انتهى");
          await player.stop();
          await player.seek(Duration.zero);
          completed;
          //  change ui
        }
        if (isready) {
          ready;
        }
        if (islodng) {
          print("🔄 الصوت بيحمل...");
          // ممكن هنا تبعت event للـ Bloc إن الصوت في مرحلة تحميل
          loading;
        }
      });

      await player.positionStream.listen((d) async {
        listenfunction!(d);
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
    required int position,
  }) async {
    try {
      await player.seek(
        Duration(minutes: position),
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
      if(!player.playing)
      await player.stop();
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
      await player.seekToNext();
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
      await player.seek(Duration.zero, index: index);
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
      if (player.processingState == ProcessingState.ready&&!player.playing)
      {
        await player.play();
      }

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
