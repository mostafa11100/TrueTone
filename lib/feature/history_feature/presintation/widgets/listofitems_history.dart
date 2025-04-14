import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../../../../core/utiles/app_assets.dart';
import 'custom_listtil.dart';
import 'getlngthofaudio.dart';

Widget listOfItems(context,void Function() navigte_function,List<VoiceEntity>listofvoices) {
  return Expanded(
    child: ListView.builder
      (
      itemCount: listofvoices.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: cUstomListTile(context, true, listofvoices[i].name ,getlngthaudio(listofvoices[i].url), ()
          {
            navigte_function();

            GoRouter.of(context).push
              (
                AppRouts.voicescreen,
                extra:listofvoices[i]
            );
          }),
        );
      },
    ),
  );
}
