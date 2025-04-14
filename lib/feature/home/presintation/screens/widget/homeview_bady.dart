import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/presintation/controlers/home_cubit.dart';
import '../../../../../core/component/custom_sniper.dart';
import '../../../../../core/component/loading.dart';
import '../../../../../core/di/si.dart';

class HomeviewBady extends StatefulWidget {
  const HomeviewBady({super.key});

  @override
  _HomeviewBadyState createState() => _HomeviewBadyState();
}

class _HomeviewBadyState extends State<HomeviewBady> {
  double _scale = 1.0;
  late Key key;

  @override
  void initState() {
    key = Key("1");

    super.initState();
  }

  void _onImageTap() async {
    // Handle any additional functionality if needed
    setState(() {
      _scale = 0.8;
    });

    Future.delayed(Duration(milliseconds: 200), () async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );
      if (result != null) {
        File file = File(result.files.single.path!);
        HomeCubit.blocprovider(
          context,
        ).checkaudio(entity: HomeEntity(file: file));
      }

      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<HomeCubit>(),

      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeFail) {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            }
            customsnackbar(
              textcolor: AppColors.onSurface,
              text: state.error,
              color: AppColors.errorcolor,
            );
          }
          if (state is HomeSuccess) {
            GoRouter.of(
              context,
            ).pushReplacement(AppRouts.typeaudioscreen, extra: state.entity);
          } else {
            showloadingdialog(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: _onImageTap, // Trigger the animation and navigation
                child: AnimatedScale(
                  scale: _scale,
                  duration: Duration(milliseconds: 100),
                  // Duration of the scale animation
                  curve: Curves.easeInOut,
                  // Smooth animation curve
                  child: Image.asset(homeimage),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Apptrings.hometitle,
                    style: TextstyleConst.texts18.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.onprimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
