import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_listtil.dart';
import '../widgets/listofitems_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key,required this
  .navigatefunction});
final void Function() navigatefunction;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(13.0.w),
          child: listOfItems(context,navigatefunction),
        ),
      )
    );
  }
}


