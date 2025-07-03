import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import 'package:animation_list/animation_list.dart';
import 'custom_listtil.dart';
import 'getlngthofaudio.dart';

Widget listOfItems(
  context,
  void Function() navigte_function,
  List<VoiceEntity> listofvoices,
) {
  return Builder(
    builder: (context) {
      return AnimationList(
        animationDirection: AnimationDirection.vertical,
        duration: 2000,
        reBounceDepth: 10.0,
        children: List.generate(listofvoices.length, (i) {
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
              },
              listofvoices[i],
            ),
          );
        }),
      );
    },
  );

  ListView.builder(
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
          },
          listofvoices[i],
        ),
      );
    },
  );
}
