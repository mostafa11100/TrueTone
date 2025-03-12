import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../../../../core/utiles/app_assets.dart';
import 'custom_listtil.dart';

Widget listOfItems(context) {
  return Expanded(
    child: ListView.builder
      (
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: cUstomListTile(context, true, "audio1", 2.25, () {
            GoRouter.of(context).push(
              AppRouts.voicePlayeScreen,
              extra: VoiceEntity(
                name: "Audio1",
                url: "",
                type: "Real",
                lngth: 25.5,
              ),
            );
          }),
        );
      },
    ),
  );
}
