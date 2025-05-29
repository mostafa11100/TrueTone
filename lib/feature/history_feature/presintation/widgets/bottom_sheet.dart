import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/history_bloc/history_bloc.dart';

import '../../../../core/component/dialog.dart';
import '../../../../core/utiles/app_textstyle.dart';

custom_bottomsheet(BuildContext context1, VoiceEntity voiceentity) {
  showModalBottomSheet(
    context: context1,

    builder: (context2) {
      return Container(
        height: MediaQuery.of(context2).size.height / 4,

        decoration: BoxDecoration(
          color: Theme.of(context2).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: SizedBox(
                width: MediaQuery.of(context2).size.width,
                child: customButton(
                  onpress: () {},
                  context2,
                  text: Apptrings.share,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: SizedBox(
                width: MediaQuery.of(context2).size.width,
                child: customButton(
                  onpress: () {
                    simpledialog(
                      context2,
                      content: Apptrings.areyousure + voiceentity.id.toString(),
                      text1: Text(
                        Apptrings.cancel,
                        style: TextstyleConst.texts18.copyWith(
                          color: Theme.of(context2).colorScheme.primary,
                        ),
                      ),
                      text2: Text(
                        Apptrings.delete,
                        style: TextstyleConst.texts20.copyWith(
                          color: Theme.of(context2).colorScheme.error,
                        ),
                      ),
                      ontap1: () {
                        GoRouter.of(context2).pop();
                      },
                      ontap2: () {
                        GoRouter.of(context2).pop();
                        GoRouter.of(context1).pop();
                        BlocProvider.of<HistoryBloc>(
                          context1,
                        ).add(DeleteHistory(voiceentity));
                      },
                    );
                  },
                  context2,
                  text: Apptrings.delete,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
