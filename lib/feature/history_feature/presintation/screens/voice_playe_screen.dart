import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/widgets/customabbBarvoicescreen.dart';

import '../../../../core/component/custom_sniper.dart';
import '../../../../core/di/si.dart';
import '../../domain/entitys/voice_entity.dart';
import '../widgets/audio_player_widget.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_proggres_indector.dart';

class VoicePlayeScreen extends StatefulWidget {
  const VoicePlayeScreen({
    super.key,
    required this.voiceEntity,
    required this.index,
  });

  final List<VoiceEntity> voiceEntity;
  final int index;

  @override
  State<VoicePlayeScreen> createState() => _VoicePlayeScreenState();
}

class _VoicePlayeScreenState extends State<VoicePlayeScreen> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<VoiceScreenBloc>(
      context,
    ).add(InitPlayList(widget.voiceEntity, widget.index));
    super.didChangeDependencies();
  }

  int? indx;

  @override
  void initState() {
    indx = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customabbBarvoicescreen(context),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<VoiceScreenBloc, VoiceScreenState>(
          listener: (context, state) {
            if (state is VoiceFail) {
              customsnackbar(
                context: context,
                textcolor: Theme.of(context).colorScheme.onError,
                color: Theme.of(context).colorScheme.error,
                text: state.error,
                then: () {},
              );
            }
          },
          builder: (context, state) {
            if (state is Voicesucce) {
              indx = state.index!;
            }

            return Column(
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
                  child: Image.asset(
                    widget.voiceEntity[indx!].type == 'real'
                        ? humanbig
                        : ropotbig,
                  ),
                ),

                SizedBox(height: 10.h),
                Text(
                  widget.voiceEntity[indx!].name ?? "notfound",
                  style: TextstyleConst.texts28.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                //SizedBox(height: 4.h,),
                Opacity(
                  opacity: .7,
                  child: Text(
                    widget.voiceEntity[indx!].type ?? "knowo",
                    style: TextstyleConst.texts18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                audioplayerputtoncustom(state, indx),
                SizedBox(height: 40.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: custombrogressBarWidget(context, state: state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
