import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';

import '../../../../core/utiles/app_assets.dart';
import 'custom_listtil.dart';
import 'getlngthofaudio.dart';

Widget listOfItems(
  context,
  void Function() navigte_function,
  List<VoiceEntity> listofvoices,

) {
  return ListView.builder(
    itemCount: listofvoices.length,
    itemBuilder: (context, i) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: cUstomListTile(
          context,
          listofvoices[i].type,
          listofvoices[i].name,
          getlngthaudio(listofvoices[i].url),
          () {
            GoRouter.of(context).push(
              AppRouts.voicescreen,
              extra: {
                "index": i,
                "voices": listofvoices,
                "bloc": context.read<VoiceScreenBloc>(),
              },
            );
          },listofvoices[i]
        ),
      );
    },
  );
}
