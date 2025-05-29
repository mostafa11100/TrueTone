import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_colors.dart';

class SettingTileWidget extends StatelessWidget {
  final IconData icon;
  final IconData? icon1;
  final String title;
  final bool isSwitch;
  final bool? switchValue;
  final ValueChanged<bool>? onChanged;
  final void Function()? onTap1;

  const SettingTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.isSwitch = false,
    this.switchValue,
    this.onChanged,
    this.icon1,
    this.onTap1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.black),
                SizedBox(width: 16.w),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                if (icon1 != null) Icon(icon1, size: 20),
                if (isSwitch && switchValue != null)
                  Switch(
                    value: switchValue!,
                    onChanged: onChanged,
                    activeColor: AppColors.onprimary,
                    activeTrackColor: AppColors.primarycolor,
                    inactiveThumbColor: AppColors.onprimary,
                    inactiveTrackColor: Colors.grey[200],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
