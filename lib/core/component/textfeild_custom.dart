import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

Widget customTextFeild(
  context, {
  required String hint,
  required String label,
  required IconData prefixicon,
  IconData? sufixicon,
  height,
  validator,
  secure,
  required TextEditingController controler,
}) {
  ColorScheme color = Theme.of(context).colorScheme;

  return SizedBox(
    height: height ?? 200.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20.h,
      children: [
        Text(label, style: TextstyleConst.texts18),
        TextFormField(
          obscureText: secure ?? false,

          controller: controler,
          validator: validator,
          decoration: decoration(
            color,
            hint,
            prefixicon,
            sufixicon,
            height,
            validator,
          ),
        ),
      ],
    ),
  );
}

InputDecoration decoration(
  color,
  String hint,

  IconData prefixicon,
  IconData? sufixicon,
  dynamic height,
  dynamic validator,
) {
  return InputDecoration(
    prefixIcon: Icon(prefixicon, size: 24.r, color: color.onSecondary),
    hintText: hint,
    suffixIcon: Icon(sufixicon, size: 24.r, color: color.onSecondary),
    hintStyle: TextstyleConst.texts16.copyWith(color: color.onSecondary),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: color.onSurface, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: color.onSurface, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: color.error, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: color.error, width: 2),
    ),
  );
}

Widget passwordtextfeildcustom(
  context, {
  required String hint,
  required String label,
  required IconData prefixicon,
  IconData? sufixicon,
  height,
  validator,
  secure,
  required TextEditingController controler,
}) {
  ColorScheme color = Theme.of(context).colorScheme;

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: height ?? 200.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20.h,
      children: [
        Text(label, style: TextstyleConst.texts18),
        FancyPasswordField(
          controller: controler,

          decoration: decoration(
            color,
            hint,
            prefixicon,
            sufixicon,
            height,
            validator,
          ),
          validationRules: {
            DigitValidationRule(),
            SpecialCharacterValidationRule(),
            MinCharactersValidationRule(8),
            MaxCharactersValidationRule(12),
          },
          strengthIndicatorBuilder: (strength) {
            return LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8.r),
              minHeight: 10.h,
              color: Theme.of(context).colorScheme.primary,

              value: strength,
            );
          },
          validationRuleBuilder: (rules, value) {
            if (value.isEmpty) {
              return const SizedBox.shrink();
            }
            return ListView(
              shrinkWrap: true,
              children:
                  rules
                      .map(
                        (rule) =>
                            rule.validate(value)
                                ? Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 10.r,
                                      child: Icon(
                                        Icons.done_outlined,
                                        size: 6.r,
                                      ),
                                    ),

                                    SizedBox(width: 12.w),
                                    Text(
                                      rule.name,
                                      style: TextstyleConst.texts16,
                                    ),
                                  ],
                                )
                                : Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        197,
                                        196,
                                        196,
                                      ),
                                      radius: 10.r,
                                    ),

                                    SizedBox(width: 12.w),
                                    Text(
                                      rule.name,
                                      style: TextstyleConst.texts16,
                                    ),
                                  ],
                                ),
                      )
                      .toList(),
            );
          },
        ),
      ],
    ),
  );
}
