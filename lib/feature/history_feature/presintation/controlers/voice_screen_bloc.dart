import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'voice_screen_event.dart';
part 'voice_screen_state.dart';

class VoiceScreenBloc extends Bloc<VoiceScreenEvent, VoiceScreenState> {
  VoiceScreenBloc() : super(VoiceScreenInitial()) {
    on<VoiceScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
