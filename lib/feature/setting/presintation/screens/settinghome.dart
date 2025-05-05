
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:truetone/core/Approuts/routs.dart';
// import 'package:truetone/core/utiles/app_colors.dart';
// import 'package:truetone/core/utiles/app_textstyle.dart';
// import 'package:truetone/feature/setting/presintation/widgets/SectionTitleWidget.dart';
// import 'package:truetone/feature/setting/presintation/widgets/settingtitle.dart';
// import 'package:truetone/feature/setting/presintation/widgets/userInfowidget.dart';




// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//      bool lockSound = true;
//    bool notifications = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(height: 280,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 140,left: 30),
//                 child: Row(
                  
//                   children: [
//                     Icon(Icons.settings,color: AppColors.onprimary,size: 31,),
//                     SizedBox(width: 14.w,),
//                     Text("Settings",style: TextstyleConst.texts30.copyWith(
//                       color: AppColors.onprimary,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.w600
//                       ),)
//                   ],
//                 ),
//               ),
            
//               decoration: BoxDecoration(
//   color: AppColors.primarycolor,
//   borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))
//               ),
//               ),
//                Container(height: 270,
//               color: Colors.white,
//               ),
//             ],
//           ),
//           Positioned(
//             top: 105,
//            left: 22,
//            right: 22,
//            bottom: 0,
//             child:Container(
//              // height: 300,
        
//               decoration: BoxDecoration(
//                       color: AppColors.onprimary,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r))
//                 ),
//               child:  Card(
//                 color: AppColors.onprimary,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18),
//                   child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                            const UserInfoWidget(),
//                            const SizedBox(height: 24),
//                           const SectionTitleWidget(title: '  Account Settings'),
//                              SizedBox(height: 18.h),
//                            SettingTileWidget(icon: Icons.edit, title: '  Edit profile',
//                           icon1: Icons.arrow_forward_ios_outlined,
//                           onTap1: () {
//                             GoRouter.of(context).push(AppRouts.EdditprofileScreen1);
//                           }
                            
                          
//                           ),
//                           SizedBox(height: 18.h),
//                            SettingTileWidget(icon: Icons.translate, title: '  Transcript Language',
//                           icon1: Icons.arrow_forward_ios_outlined,
//                             onTap1: () {
//                             GoRouter.of(context).push(AppRouts.LanguagePage1);
//                           }),
//                           SizedBox(height: 11.h),
//                           SettingTileWidget(
//                             icon: Icons.volume_up_outlined,
//                             title: '  Lock Sound',
//                             isSwitch: true,
//                              switchValue: lockSound,
//                             onChanged: (val) => setState(() => lockSound = val),
//                            ),
//                           SettingTileWidget(
//                              icon: Icons.notifications_none_outlined,
//                             title: '  Notifications',
//                             isSwitch: true,
//                              switchValue: notifications,
//                             onChanged: (val) => setState(() => notifications = val),
//                           ),
//                           SizedBox(height: 8.h),
//                            const SettingTileWidget(icon: Icons.delete_outline_outlined, title: '  Delete account',icon1: Icons.arrow_forward_ios_outlined,),
//                            SizedBox(height: 20.h),
//                            Divider(thickness: 0.4.h),
//                              SizedBox(height: 8.h),
//                           const SectionTitleWidget(title: 'More'),
                         
//                           SizedBox(height: 15.h),
//                           const SettingTileWidget(icon: Icons.privacy_tip_outlined, title: '  Privacy Policy',icon1: Icons.arrow_forward_ios_outlined,),
//                           SizedBox(height: 18.h),
//                           const SettingTileWidget(icon: Icons.contact_mail_outlined, title: '  Contact',icon1: Icons.arrow_forward_ios_outlined,),
//                         ],
//                        ),
//                 ),
//               ),
//             ))
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/setting/data/model.dart';

import 'package:truetone/feature/setting/presintation/manger/fetch/fetchprofile_cubit.dart';
import 'package:truetone/feature/setting/presintation/widgets/SectionTitleWidget.dart';
import 'package:truetone/feature/setting/presintation/widgets/settingtitle.dart';
import 'package:truetone/feature/setting/presintation/widgets/userInfowidget.dart';
 // لو لم تكن قد أضفت الـ UserProfile بعد


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockSound = true;
  bool notifications = false;

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<FetchProfileCubit>().fetchProfile(); // استدعاء الـ Cubit لجلب بيانات المستخدم
  // }
  @override
  void didChangeDependencies() {
    context.read<FetchProfileCubit>().fetchProfile();
    super.didChangeDependencies();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140, left: 30),
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: AppColors.onprimary, size: 31),
                      SizedBox(width: 14.w),
                      Text(
                        "Settings",
                        style: TextstyleConst.texts30.copyWith(
                          color: AppColors.onprimary,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 270,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            top: 105,
            left: 22,
            right: 22,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.onprimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Card(
                color: AppColors.onprimary,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<FetchProfileCubit, FetchProfileState>(
                        builder: (context, state) {
                          if (state is FetchProfileLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is FetchProfileSuccess) {
                            final UserProfile user = state.profile; // هنا هتستخدم الـ UserProfile
                            return UserInfoWidget(user: user); // تمرير الـ UserProfile ل UserInfoWidget
                          } else if (state is FetchProfileFailure) {
                            return Center(child: Text('Error: ${state.message1}'));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      const SectionTitleWidget(title: '  Account Settings'),
                      SizedBox(height: 18.h),
                      SettingTileWidget(
                        icon: Icons.edit,
                        title: '  Edit profile',
                        icon1: Icons.arrow_forward_ios_outlined,
                        onTap1: () {
                          GoRouter.of(context).push(AppRouts.EdditprofileScreen1);
                        },
                      ),
                      SizedBox(height: 18.h),
                      SettingTileWidget(
                        icon: Icons.translate,
                        title: '  Transcript Language',
                        icon1: Icons.arrow_forward_ios_outlined,
                        onTap1: () {
                          GoRouter.of(context).push(AppRouts.LanguagePage1);
                        },
                      ),
                      SizedBox(height: 11.h),
                      SettingTileWidget(
                        icon: Icons.volume_up_outlined,
                        title: '  Lock Sound',
                        isSwitch: true,
                        switchValue: lockSound,
                        onChanged: (val) => setState(() => lockSound = val),
                      ),
                      SettingTileWidget(
                        icon: Icons.notifications_none_outlined,
                        title: '  Notifications',
                        isSwitch: true,
                        switchValue: notifications,
                        onChanged: (val) => setState(() => notifications = val),
                      ),
                      SizedBox(height: 8.h),
                      const SettingTileWidget(
                        icon: Icons.delete_outline_outlined,
                        title: '  Delete account',
                        icon1: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(height: 20.h),
                      Divider(thickness: 0.4.h),
                      SizedBox(height: 8.h),
                      const SectionTitleWidget(title: 'More'),
                      SizedBox(height: 15.h),
                      const SettingTileWidget(
                        icon: Icons.privacy_tip_outlined,
                        title: '  Privacy Policy',
                        icon1: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(height: 18.h),
                      const SettingTileWidget(
                        icon: Icons.contact_mail_outlined,
                        title: '  Contact',
                        icon1: Icons.arrow_forward_ios_outlined,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
