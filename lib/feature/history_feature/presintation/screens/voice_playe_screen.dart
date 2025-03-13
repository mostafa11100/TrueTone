import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/widgets/photo_hero_custom.dart';

import '../../../../core/component/custom_sniper.dart';
import '../../domain/entitys/voice_entity.dart';
import '../widgets/audio_player_widget.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_proggres_indector.dart';

class VoicePlayeScreen extends StatefulWidget {
  const VoicePlayeScreen({super.key, required this.voiceEntitylist});

  final List<VoiceEntity> voiceEntitylist;

  @override
  State<VoicePlayeScreen> createState() => _VoicePlayeScreenState();
}

class _VoicePlayeScreenState extends State<VoicePlayeScreen> {
  @override
  void initState() {
    // BlocProvider.of<VoiceScreenBloc>(
    //   context,
    // ).add(InitPlayList(widget.voiceEntitylist));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withAlpha((.9 * 255).toInt()),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              custom_bottomsheet(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Icon(
                Icons.more_horiz_outlined,
                size: 28.r,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocConsumer<VoiceScreenBloc, VoiceScreenState>(
        listener: (context, state) {
          if (state is VoiceFail) {
            customsnackbar(
              context: context,
              textcolor: Theme.of(context).colorScheme.onError,
              color: Theme.of(context).colorScheme.error,
              then: () {},
            );
          }
        },
        builder: (context, state) {
          int indx = 0;
          Duration lngth = Duration.zero;
          Duration position = Duration.zero;
          if (state is Voicesucce) {
            indx = state.index;
            lngth = state.duration;
            position = state.durationplayed;
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Container(
                  //  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 15.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryFixed,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: .8,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  height: 225.h,
                  width: 225.w,
                  child: Image.asset(humanbig),
                ),

                SizedBox(height: 10.h),
                Text(
                  widget.voiceEntitylist[indx].name ?? "notfound",
                  style: TextstyleConst.texts28.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                //SizedBox(height: 4.h,),
                Opacity(
                  opacity: .7,
                  child: Text(
                    widget.voiceEntitylist[indx].type ?? "knowo",
                    style: TextstyleConst.texts18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                aUdioPlayerCutom(),
                SizedBox(height: 40.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Customprogress(context, lngth, position),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
