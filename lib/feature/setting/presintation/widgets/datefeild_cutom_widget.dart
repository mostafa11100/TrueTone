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
  late final DateTime _firstDate;
  late final DateTime _lastDate;

  @override
  void initState() {
    super.initState();
    _firstDate = DateTime.now().add(const Duration(days: 10));
    _lastDate = DateTime.now().add(const Duration(days: 40));
  }

  DateTime _getValidInitialValue() {
    if (widget.intailalue.isBefore(_firstDate)) {
      return _firstDate;
    } else if (widget.intailalue.isAfter(_lastDate)) {
      return _lastDate;
    } else {
      return widget.intailalue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Apptrings.date,
          style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // لون الأزرار (OK, Cancel)
              onPrimary: Colors.white, // لون النص على الزرار
              onSurface: Colors.black, // لون النص داخل البيكر
            ),
          ),
          child: DateTimeFormField(
            initialValue: _getValidInitialValue(),
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
                borderSide: const BorderSide(width: 1.2),
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
            firstDate: _firstDate,
            lastDate: _lastDate,
            initialPickerDateTime: _getValidInitialValue(),
            onChanged: (DateTime? value) {
              widget.onchanged(value);
            },
          ),
        ),
      ],
    );
  }
}
