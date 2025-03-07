import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

loadingdialog(context)
{
  if (ModalRoute
      .of(context)
      ?.isCurrent == false)
  {

    print('enter222 to rooooouuuuuttt');
    Navigator.of(context).pop();
  }

  Future.delayed(Duration(seconds: 3),()
  {
    if (ModalRoute
      .of(context)
      ?.isCurrent == false)
  {
    Navigator.of(context).pop();
  }

  });
  return showDialog(barrierDismissible: false,context: context, builder: (context)
  {
    return Center
      (
        child: LoadingAnimationWidget.
        inkDrop(color: Theme.of(context).colorScheme.onSurface,
            size: 30.w));
  });
}