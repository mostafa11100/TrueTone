import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/utiles/app_strings.dart';

import '../../../../core/component/dialog.dart';
import '../../../../core/utiles/app_textstyle.dart';

custom_bottomsheet(BuildContext context) {
  showModalBottomSheet(
    context: context,

    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height / 4,

        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: customButton(
                  onpress: () {},
                  context,
                  text: Apptrings.share,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: customButton(
                  onpress: () {
                    simpledialog(
                      context,
                      content: Apptrings.areyousure,
                      text1: Text(
                        Apptrings.cancel,
                        style: TextstyleConst.texts18.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      text2: Text(
                        Apptrings.delete,
                        style: TextstyleConst.texts20.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      ontap1: ()
                      {
                        print("enter tobutton");
GoRouter.of(context).pop();
                      },
                      ontap2: ()
                      {

                      },
                    );
                  },
                  context,
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
