import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

import '../controlers/voice_screen_bloc.dart';

Widget Customprogress(context, Duration? lngthe, Duration? position) {
  Duration lngth = lngthe ?? Duration.zero;
  Duration pos = position ?? Duration.zero;

  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {

      print('progressssssssssssssssssssssssssssssssssssssssssss${pos.inSeconds}');
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            calcposition(Duration(seconds: lngthe!.inSeconds - pos.inSeconds)),
            style: TextstyleConst.texts14.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
              height: 6.h,
              child: Slider(
                padding: EdgeInsets.zero,
                inactiveColor: Theme.of(
                  context,
                ).colorScheme.onPrimary.withOpacity(.6),
                activeColor: Theme.of(context).colorScheme.onPrimary,
                value: pos.inSeconds.toDouble(),
                max: lngthe.inSeconds.toDouble(),
                onChanged: (v) {
                  setState(() {
                    pos=Duration(seconds: v.toInt());

                  });
                  BlocProvider.of<VoiceScreenBloc>(
                    context,
                  ).add(Seektopostion(pos));
                },
              ),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              BlocProvider.of<VoiceScreenBloc>(context).add((PlayNext()));
            },
            child: Text(
              calcposition(pos),
              style: TextstyleConst.texts14.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
              ),
            ),
          ),
        ],
      );
    },
  );
}

String calcposition(Duration d) {
  String m = d.inMinutes.toString().padLeft(2, '0');
  String s = (d.inSeconds % 60).toString().padLeft(2, '0');
  return m + ':' + s;
}

Widget custombrogressBarWidget(context, {state}) {
  if(state is Voicesucce)
    {print( "function in buid===${state.duration!.inSeconds}");}
  return BlocBuilder<VoiceScreenBloc, VoiceScreenState>(
    buildWhen: (p, c) {
      if (c is Voicedurationupdate|| c is Voicesucce) return true;
      return false;
    },
    builder: (context, state) {
      if (state is Voicedurationupdate)
        return Customprogress(context, state.lngth, state.position);
      if(state is Voicesucce)
       {
         return Customprogress(context, state.duration, Duration.zero);}
      else
        return Customprogress(context, Duration(seconds: 0), Duration.zero);
    },
  );
}
