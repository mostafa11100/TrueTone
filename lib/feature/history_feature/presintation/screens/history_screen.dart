import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/history_bloc/history_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/widgets/empty_history_widget.dart';

import '../../../../core/component/custom_sniper.dart';
import '../../../../core/component/dialog.dart';
import '../../../../core/di/si.dart';
import '../../domain/entitys/voice_entity.dart';
import '../controlers/voice_screen_bloc.dart';
import '../widgets/custom_listtil.dart';
import '../widgets/error_widget_hstotry.dart';
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
  void didChangeDependencies() {
    BlocProvider.of<HistoryBloc>(context).add(FetchHistoryEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(13.0.w),
          child: BlocConsumer<HistoryBloc, HistoryState>(
            listener: (context, state) {
              if (state is HistorySuccessFetch) {
                //  GoRouter.of(context).pop();
                setState(() {
                  listofvoices = state.listofhistory;
                });

              }
              if (state is HistoryDeleteSuccess) {
                //GoRouter.of(context).pop();
                customsnackbar(
                  textcolor: AppColors.onSurface,
                  text: Apptrings.hasbeendleted,
                  color: AppColors.primarycolor,
                );
              }
              if (state is HistoryFail) {
                //GoRouter.of(context).pop();
                customsnackbar(
                  context: context,
                  textcolor: AppColors.onprimary,
                  text: state.error,
                  color: AppColors.errorcolor,
                );
                // show error
              }
            },
            builder: (BuildContext context, HistoryState state) {
              if (state is HistorySuccessFetch) {
                return listofvoices.isEmpty
                    ? eMptyHistory()
                    : listOfItems(
                      context,
                      widget.navigatefunction,
                      listofvoices,
                    );
              }
              if (state is HistoryFail) {
                return eRrorHstoryWidget();
              } else {
                return Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Opacity(
                      opacity: .8,
                      child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
