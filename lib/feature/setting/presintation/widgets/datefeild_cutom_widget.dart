import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utiles/app_strings.dart';
import '../../../../core/utiles/app_textstyle.dart';

class DateTimeFeildCustom extends StatefulWidget {
  const DateTimeFeildCustom({
    super.key,
    required this.intailalue,
    required this.onchanged,
  });

  final DateTime intailalue;
  final Function(DateTime? value) onchanged;

  @override
  State<DateTimeFeildCustom> createState() => _DateTimeFeildCustomState();
}

class _DateTimeFeildCustomState extends State<DateTimeFeildCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          Apptrings.date,
          style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
        ),
        DateTimeFormField(
          initialValue: widget.intailalue,
          mode: DateTimeFieldPickerMode.date,
          style: TextstyleConst.texts16.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withAlpha((.6 * 255).toInt()),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 17.h,
              horizontal: 15.w,
            ),
            errorStyle: TextstyleConst.texts16.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),

            hintStyle: TextstyleConst.texts16.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.2),
              borderRadius: BorderRadius.circular(15.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),

              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1.1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
            ),
          ),

          firstDate: DateTime.now().add(const Duration(days: 10)),
          lastDate: DateTime.now().add(const Duration(days: 40)),
          initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
          onChanged: (DateTime? value) {
            setState(() {
              widget.onchanged(value);
            });
          },
        ),
      ],
    );
  }
}
