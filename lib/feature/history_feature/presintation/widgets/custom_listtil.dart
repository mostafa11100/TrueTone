import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/history_feature/presintation/widgets/photo_hero_custom.dart';

import '../../../../core/Approuts/routs.dart';
import 'bottom_sheet.dart';

Widget cUstomListTile(context, type, text,lngth,ontap) {
  return CustomListTile (onTap:ontap ,height: 67.h,leading: Container(

    alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(0.r),decoration: BoxDecoration
    (
      color: Theme.of(context).colorScheme.secondaryFixed,
      border: Border.all(color: Theme.of(context).colorScheme.onSurface,width: .8),
      borderRadius: BorderRadius.circular(8.r)

  ),
      width: 76.w,child:pHoto(humanbig, 225.w.toDouble()) ),
    title: Padding(
      padding:  EdgeInsets.symmetric(vertical:4.0),
      child: Text(
        text,
        style: TextstyleConst.texts20.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
    subTitle: Opacity(
      opacity: .7,
      child: Text(
        type?"Real":"Fake",
        style: TextstyleConst.texts18.copyWith
          (
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      
      ),
    ),
    trailing: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,children:
      [
        InkWell(onTap: ()
        {
          custom_bottomsheet(context);
        },child: Icon(Icons.more_horiz_outlined,size: 26.r,color: Theme.of(context).colorScheme.onPrimary,)),
         SizedBox(height: 8.h),
        Opacity(
          opacity: .7,
          child: Text(
            lngth.toString(),
            style: TextstyleConst.texts18.copyWith
              (
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimary,
            ),

          ),
        ),
      ],),
    ),



  );
}



// Custom list tile definition
class CustomListTile extends StatelessWidget {
  final Widget? leading; // Optional leading widget
  final Widget? title; // Required title text
  final Widget? subTitle; // Optional subtitle text
  final Function? onTap; // Optional tap event handler
  final Function? onLongPress; // Optional long press event handler
  final Function? onDoubleTap; // Optional double tap event handler
  final Widget? trailing; // Optional trailing widget
  final Color? tileColor; // Optional tile background color
  final double? height; // Required height for the custom list tile

  // Constructor for the custom list tile
  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subTitle,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.trailing,
    this.tileColor,
    required this.height, // Make height required for clarity
  });

  @override
  Widget build(BuildContext context) {
    return Material( // Material design container for the list tile
      color: Colors.transparent, // Set background color if provided
      child: InkWell( // Tappable area with event handlers
        onTap:  (){
          print("innnnn");
          GoRouter.of(context).push(AppRouts.voiceplayscreen,extra: human );
          onTap;}, // Tap event handler
        onDoubleTap: () => onDoubleTap, // Double tap event handler
        onLongPress: () => onLongPress, // Long press event handler
        child: SizedBox( // Constrain the size of the list tile
          height: height, // Set custom height from constructor
          child: Row( // Row layout for list item content
            children: [
              Padding( // Padding for the leading widget
                padding:  EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: leading, // Display leading widget
              ),
              Expanded( // Expanded section for title and subtitle
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column( // Column layout for title and subtitle
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ SizedBox(height: 2.h),
                      title ?? const SizedBox(), // Display title or empty space
                       SizedBox(height: 5.w), // Spacing between title and subtitle
                      subTitle ?? const SizedBox(), // Display subtitle or empty space
                    ],
                  ),
                ),
              ),
              Padding( // Padding for the trailing widget
                padding:  EdgeInsets.zero,
                child: trailing, // Display trailing widget
              )
            ],
          ),
        ),
      ),
    );
  }
}