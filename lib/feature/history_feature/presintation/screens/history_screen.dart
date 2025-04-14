import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/history_bloc/history_bloc.dart';

import '../../../../core/component/custom_sniper.dart';
import '../../../../core/component/dialog.dart';
import '../../../../core/di/si.dart';
import '../../domain/entitys/voice_entity.dart';
import '../widgets/custom_listtil.dart';
import '../widgets/listofitems_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.navigatefunction});

  final void Function() navigatefunction;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<VoiceEntity> listofvoices = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HistoryBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(13.0.w),
            child: BlocListener<HistoryBloc, HistoryState>(
              listener: (context, state) {
                if (state is HistorySuccessFetch) {
                  setState(() {
                    listofvoices = state.listofhistory;
                  });
                }
                if (state is HistoryDeleteSuccess) {
                  customsnackbar(
                    textcolor: AppColors.onSurface,
                    text: Apptrings.hasbeendleted,
                    color: AppColors.primarycolor,
                  );
                }
                if (state is HistoryFail)
                {  customsnackbar(
                  textcolor: AppColors.onSurface,
                  text: state.error,
                  color: AppColors.errorcolor,
                );
                  // show error
                } else {
                  loadingdialog(context);
                  //show loading
                }
              },
              child: listOfItems(context, widget.navigatefunction,listofvoices),
            ),
          ),
        ),
      ),
    );
  }
}
