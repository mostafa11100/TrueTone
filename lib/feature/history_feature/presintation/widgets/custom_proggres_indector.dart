import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

import '../controlers/voice_screen_bloc.dart';

Widget Customprogress(context,Duration? lngthe, Duration? position ) {
  Duration lngth=lngthe??Duration.zero;
  Duration pos=position??Duration.zero;
return  StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState)
  {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          lngth.inMinutes.toString(),
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
              value:pos.inMinutes/100,
              onChanged: (v)
              {
                BlocProvider.of<VoiceScreenBloc>(context).add(Seektopostion(v));


              },
            ),
          ),
        ),
        InkWell(
          hoverColor: Colors.transparent,
          onTap: ()
          {
            BlocProvider.of<VoiceScreenBloc>(context).add((PlayNext()));

          },
          child: Text(
            lngth.inMinutes.toString(),
            style: TextstyleConst.texts14.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
            ),
          ),
        ),
      ],
    );
  },);


}
