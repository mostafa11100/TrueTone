import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../controlers/voice_screen_bloc.dart';

class aUdioPlayerCutom extends StatefulWidget {
  const aUdioPlayerCutom({super.key});

  @override
  State<aUdioPlayerCutom> createState() => _aUdioPlayerCutomState();
}

class _aUdioPlayerCutomState extends State<aUdioPlayerCutom> {
  bool playe=false;
  bool playefirst=false;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 25.w,
      children: [
        InkWell(onTap: ()async
        {
        //  await widget.audioplayer.;
          BlocProvider.of<VoiceScreenBloc>(context).add(PlayBefore())
        ;},
          child: Icon(
            Icons.fast_rewind_rounded,
            size: 32.r,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),

        SizedBox(
          width: 75.w,
          height: 75.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Theme.of(
                context,
              ).colorScheme.onPrimary.withOpacity(.4),
            ),
            onPressed: ()async
            {


              if(playefirst)
                {
                  if(playe)
                    {
                      BlocProvider.of<VoiceScreenBloc>(context).add(Stop());

                    }
                  else
                    {BlocProvider.of<VoiceScreenBloc>(context).add(Pause());

                    }
                }else
                {

                playefirst=true;
              }



            },
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child:playe? Icon(
                  Icons.pause,
                  size: 35.r,
                  color: Theme.of(context).colorScheme.onPrimary,
                ):Icon(
                  Icons.pause,
                  size: 35.r,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),

        InkWell(
          onTap: ()
          {
            BlocProvider.of<VoiceScreenBloc>(context).add(Pause());
          },
          child: Icon(
            Icons.fast_forward_rounded,
            size: 32.r,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}

