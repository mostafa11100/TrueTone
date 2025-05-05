import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../controlers/voice_screen_bloc.dart';

class aUdioPlayerCutom extends StatefulWidget {
  aUdioPlayerCutom({super.key, required this.loading, required this.index});

  int index;
  bool loading;

  @override
  State<aUdioPlayerCutom> createState() => _aUdioPlayerCutomState();
}

class _aUdioPlayerCutomState extends State<aUdioPlayerCutom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<VoiceScreenBloc, VoiceScreenState>(
      buildWhen: (previce,current)
      {if(current is VoiceFail||current is VoiceButtonstate ||current is Voicesucce)return true;
        return false;


      },
      builder: (context, state) {


        if ( widget.loading) {
          return button_custom(context: context, loading: true);
        }
        if (state is VoiceFail||state is  Voicesucce)
        {
          return  button_custom(
            context: context,
            loading: false,
            index: widget.index,
          );
        }
        if (state is VoiceButtonstate)
        {
          print("entttttttttttttttttttttttttttttttttttttttttttttttttter ${state.play}");
          return button_custom(
            context: context,
            loading: false,
            play: state.play,
            index: widget.index,
          );
        }
        else {
          return button_custom(
            context: context,
            loading: false,
            play: false,
            index: widget.index,
          );
        }
      },
    );
  }
}

Widget button_custom({context, loading = false, play = false, index = 0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 25.w,
    children: [
      InkWell(
        onTap: () async {
          BlocProvider.of<VoiceScreenBloc>(context).add(PlayBefore());
        },
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
          onPressed:
              loading
                  ? null
                  : () async {
                    if (!play)
                      BlocProvider.of<VoiceScreenBloc>(context).add(Pause());
                    else
                      BlocProvider.of<VoiceScreenBloc>(context).add(Stop());
                  },
          child: Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child:
                  loading
                      ? Center(
                        child: SizedBox(
                          height: 25.r,
                          width: 25.r,
                          child: CircularProgressIndicator(
                            color: AppColors.onprimary,
                          ),
                        ),
                      )
                      : play
                      ? Icon(
                        Icons.pause,
                        size: 35.r,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                      : Icon(
                        Icons.play_arrow_rounded,
                        size: 35.r,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
            ),
          ),
        ),
      ),

      InkWell(
        onTap: () {
          BlocProvider.of<VoiceScreenBloc>(context).add(PlayNext());
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

audioplayerputtoncustom(state, indx)
{
  if (state is Voiceloading)
    return aUdioPlayerCutom(loading: true, index: indx!);
  else
    return aUdioPlayerCutom(loading: false, index: indx!);
}
