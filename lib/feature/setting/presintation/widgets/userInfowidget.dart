// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:truetone/core/utiles/app_assets.dart';

// class UserInfoWidget extends StatelessWidget {
//   const UserInfoWidget({Key? key}) : super(key: key);

// @override Widget build(BuildContext context) {
//   return Container( padding: const EdgeInsets.symmetric(vertical: 12),
//    decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(16),
//     boxShadow: [ BoxShadow( color: Colors.black.withOpacity(0.05),
//      blurRadius: 10, offset: const Offset(0, 5), ) ], ),
//       child: Row( children: [
//          CircleAvatar( radius: 35,
//          backgroundImage:AssetImage( human) ),
//           SizedBox(width: 26.w), Column( crossAxisAlignment: CrossAxisAlignment.start,
//           children:  [ Text( 'Mohamed hany',
//            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), ),
//             SizedBox(height: 4.h),
//              Text( 'mohany858@gmail.com',
//               style: TextStyle(color: Colors.grey, fontSize: 14), ), ], ) ], ), ); } }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/setting/data/model.dart';

class UserInfoWidget extends StatelessWidget {
  final UserProfile user;

  const UserInfoWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(
            user.profileImageUrl.isNotEmpty
                ? user.profileImageUrl
                : 'https://via.placeholder.com/150',
          ),
          backgroundColor: Colors.grey[300],
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name.isNotEmpty ? user.name : 'Unknown',
              style: TextstyleConst.texts20,
            ),
            SizedBox(height: 4.h),
            Text(
              user.email.isNotEmpty ? user.email : 'No email provided',
              style: TextstyleConst.texts14.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
