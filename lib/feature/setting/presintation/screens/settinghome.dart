import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/setting/date/rebo/homereboimp.dart';
import 'package:truetone/feature/setting/presintation/manger/fetch/fetchprofile_cubit.dart';
import 'package:truetone/feature/setting/presintation/widgets/SectionTitleWidget.dart';
import 'package:truetone/feature/setting/presintation/widgets/settingtitle.dart';
import 'package:truetone/feature/setting/presintation/widgets/userInfowidget.dart';
import 'package:truetone/core/network/api_servise.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truetone/feature/setting/date/model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockSound = true;
  bool notifications = false;
  FetchProfileCubit? cubit;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      cubit = FetchProfileCubit(HomeRepoImpl(ApiService(Dio())))
        ..fetchProfile();
      isInit = true;
    }
  }

  @override
  void dispose() {
    cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit!,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: 300.h,
                  padding: EdgeInsets.only(bottom: 140.h, left: 30.w),
                  decoration: BoxDecoration(
                    color: AppColors.primarycolor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: AppColors.onprimary,
                        size: 31.r,
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        "Settings",
                        style: TextstyleConst.texts30.copyWith(
                          color: AppColors.onprimary,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    primary: true,
                    padding: EdgeInsets.only(top: 100),
                    dragStartBehavior: DragStartBehavior.down,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.onprimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
                        builder: (context, state) {
                          if (state is FetchProfileLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is FetchProfileFailure) {
                            return Center(
                              child: Text(
                                "Error: ${state.message1}",
                                textAlign: TextAlign.center,
                              ),
                            );
                          } else if (state is FetchProfileSuccess) {
                            final profile = state.profile;

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0.h,
                                      horizontal: 10.w,
                                    ),
                                    child: UserInfoWidget(
                                      name: profile.name,
                                      email: profile.email,
                                      imageUrl: profile.profileImageUrl,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: .5,
                                    child: Divider(
                                      thickness: 0.4,
                                      color: AppColors.greycolor,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const SectionTitleWidget(
                                    title: '  Account Settings',
                                  ),
                                  SizedBox(height: 20.h),
                                  SettingTileWidget(
                                    icon: Icons.edit,
                                    title: '  Edit profile',
                                    icon1: Icons.arrow_forward_ios_outlined,
                                    onTap1: () async {
                                      final result = await GoRouter.of(
                                        context,
                                      ).push<UserProfile>(
                                        AppRouts.setting1,
                                        extra: profile,
                                      );

                                      debugPrint(
                                        "Returned from EditProfileScreen: $result",
                                      );

                                      if (result != null && mounted) {
                                        cubit
                                            ?.fetchProfile(); // أو استخدم result لتحديث مباشر
                                        setState(() {});
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                  SettingTileWidget(
                                    icon: Icons.translate,
                                    title: '  Transcript Language',
                                    icon1: Icons.arrow_forward_ios_outlined,
                                    onTap1: () {},
                                  ),
                                  SizedBox(height: 8.h),
                                  SettingTileWidget(
                                    icon: Icons.volume_up_outlined,
                                    title: '  Lock Sound',
                                    isSwitch: true,
                                    switchValue: lockSound,
                                    onChanged:
                                        (val) =>
                                            setState(() => lockSound = val),
                                  ),
                                  SettingTileWidget(
                                    icon: Icons.notifications_none_outlined,
                                    title: '  Notifications',
                                    isSwitch: true,
                                    switchValue: notifications,
                                    onChanged:
                                        (val) =>
                                            setState(() => notifications = val),
                                  ),
                                  SizedBox(height: 10.h),
                                  const SettingTileWidget(
                                    icon: Icons.delete_outline_outlined,
                                    title: '  Delete account',
                                    icon1: Icons.arrow_forward_ios_outlined,
                                  ),
                                  SizedBox(height: 18.h),
                                  Divider(thickness: 0.5.h),
                                  SizedBox(height: 8.h),
                                  const SectionTitleWidget(title: 'More'),
                                  SizedBox(height: 10.h),
                                  const SettingTileWidget(
                                    icon: Icons.privacy_tip_outlined,
                                    title: '  Privacy Policy',
                                    icon1: Icons.arrow_forward_ios_outlined,
                                  ),
                                  SizedBox(height: 10.h),
                                  const SettingTileWidget(
                                    icon: Icons.contact_mail_outlined,
                                    title: '  Contact',
                                    icon1: Icons.arrow_forward_ios_outlined,
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            );
                          }

                          return SizedBox();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
