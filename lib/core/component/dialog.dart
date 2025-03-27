import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

loadingdialog(BuildContext context) {

  // if (context!=null) {
  //   Navigator.of(context).pop();
  // }

  Future.delayed(Duration(seconds: 2), () {
    if(context.mounted==false)
    if (ModalRoute.of(context)?.isCurrent == false) {
      Navigator.of(context).pop();
    }
  });
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Theme.of(context).colorScheme.onPrimary,
          size: 30.w,
        ),
      );
    },
  );
}

simpledialog(
  context, {
  required String content,
  required Text text1,
  required Text text2,
  required Function() ontap1,
  required Function() ontap2,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        actions: [
          SizedBox(
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(40.r),
      ),
                    onTap: ()
                    {
ontap1();
                    },
                    child: Container(
                      height: 70.h,

                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity((.5)),
                          ),
                        ),
                      ),
                      child: InkWell(child: text1),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                    ),
                    onTap:(){ontap2();},
                    child: Container(
                      height: 70.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                          ),
                          left: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary.withOpacity((.9)),
                          ),
                        ),
                      ),
                      child: text2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        contentPadding: EdgeInsets.all(25.w),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: TextstyleConst.texts20.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    },
  );
}
