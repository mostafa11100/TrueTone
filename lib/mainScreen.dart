import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/history_bloc/history_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/controlers/voice_screen_bloc.dart';
import 'package:truetone/feature/history_feature/presintation/screens/history_screen.dart';
import 'package:truetone/feature/history_feature/presintation/screens/voice_playe_screen.dart';
import 'package:truetone/feature/home/presintation/screens/home_views.dart';
import 'package:truetone/feature/setting/presintation/screens/settinghome.dart';
import 'package:truetone/feature/setting/presintation/screens/settinghome.dart';

import 'core/di/si.dart';
import 'feature/setting/presintation/screens/eddit_profile.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  late final PageController _pageController;

  late final ValueNotifier<int> _selectedNotifier;

  @override
  void initState() {
    _screens = [
      HomeViews(),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<HistoryBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<VoiceScreenBloc>(),
          ),
        ],
        child: HistoryScreen(
          navigatefunction: () {
            _onItemTap(3);
          },
        ),
      ),
      SettingsScreen(),
    ];
    _pageController = PageController();
    _selectedNotifier = ValueNotifier(0);

    super.initState();
  }

  late final List<Widget> _screens;

  void _onItemTap(int index) {
    _selectedNotifier.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primarycolor,
      body: Stack(
  children: [
    PageView(
      controller: _pageController,
      onPageChanged: (value) => _selectedNotifier.value = value,
      physics: const NeverScrollableScrollPhysics(),
      children: _screens,
    ),

    Positioned(
      left: 10.w,
      right: 10.w,
      bottom: 10.h,
      child: ValueListenableBuilder<int>(
        valueListenable: _selectedNotifier,
        builder: (context, selectedIndex, _) {
          return Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _onItemTap(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 30.r,
                        color: selectedIndex == 1
                            ? AppColors.primarycolor
                            : AppColors.onSurface,
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? AppColors.primarycolor
                              : Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTap(0),
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppColors.primarycolor
                          : AppColors.onprimary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedIndex == 0
                            ? Colors.transparent
                            : AppColors.primarycolor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.graphic_eq,
                      size: 30.r,
                      color: selectedIndex == 0
                          ? AppColors.onprimary
                          : AppColors.primarycolor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTap(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 30.r,
                        color: selectedIndex == 2
                            ? AppColors.primarycolor
                            : AppColors.onSurface,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color: selectedIndex == 2
                              ? AppColors.primarycolor
                              : Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  ],
),
      ),
    );
  }
}
