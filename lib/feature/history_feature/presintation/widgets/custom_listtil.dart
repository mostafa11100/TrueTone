import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import 'bottom_sheet.dart';

Widget cUstomListTile(
  context,
  type,
  text,
  Future<String> lngth,
  ontap,
  VoiceEntity voiceentity,
) {
  return CustomListTile(
    onTap: ontap,
    height: 80.h,
    leading: Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(0.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryFixed,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: .8,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 76.w,
      child: Image.asset(type == "real" ? humanbig : ropotbig),
    ),
    title: Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
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
        type,
        style: TextstyleConst.texts18.copyWith(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
    trailing: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              custom_bottomsheet(context, voiceentity);
            },
            child: Icon(
              Icons.more_horiz_outlined,
              size: 26.r,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 14.h),
          Opacity(
            opacity: .7,
            child: FutureBuilder(
              future: lngth,
              builder: (context, snapchat) {
                if (snapchat.data == null)
                  return Text(
                    "00:00",
                    style: TextstyleConst.texts18.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  );
                return Text(
                  snapchat.data.toString(),
                  style: TextstyleConst.texts18.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
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

// Custom list tile definition
class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Function()? onTap; // Optional tap event handler
  final Function? onLongPress;
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
    return Material(
      // Material design container for the list tile
      color: Colors.transparent, // Set background color if provided
      child: GestureDetector(
        // Tappable area with event handlers
        onTap: () {
          //  GoRouter.of(context).push(AppRouts.voicescreen, extra: human);
          onTap!();
        }, // Tap event handler
        onDoubleTap: () => onDoubleTap, // Double tap event handler
        onLongPress: () => onLongPress, // Long press event handler
        child: SizedBox(
          // Constrain the size of the list tile
          height: height, // Set custom height from constructor
          child: Row(
            // Row layout for list item content
            children: [
              Padding(
                // Padding for the leading widget
                padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: leading, // Display leading widget
              ),
              Expanded(
                // Expanded section for title and subtitle
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    // Column layout for title and subtitle
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align text left
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      title ?? const SizedBox(),
                      // Display title or empty space
                      SizedBox(height: 5.w),
                      // Spacing between title and subtitle
                      subTitle ?? const SizedBox(),
                      // Display subtitle or empty space
                    ],
                  ),
                ),
              ),
              Padding(
                // Padding for the trailing widget
                padding: EdgeInsets.zero,
                child: trailing, // Display trailing widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
