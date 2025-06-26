import 'package:flutter/material.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

customsnackbar({context, text, color, required textcolor, then}) async {
  if (ModalRoute.of(context)?.isCurrent == false) {
    Navigator.of(context).pop();
  }
  ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Center(
            child: Text(
              text,
              style: TextstyleConst.texts16.copyWith(color: textcolor),
            ),
          ),
          backgroundColor: color,
        ),
      )
      .closed
      .then((v) {
        if (then != null) then();
      });
}
