import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/screens/voice_playe_screen.dart';

class VoiceScreenBlocValue extends StatelessWidget {
  const VoiceScreenBlocValue(
      {super.key, required this.voices, required this.bloc, required this.index});

  final List<VoiceEntity>voices;
  final VoiceScreenBloc bloc;
  final int index;


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: VoicePlayeScreen
        (voiceEntity: voices,
           index: index),
    );
  }
}
