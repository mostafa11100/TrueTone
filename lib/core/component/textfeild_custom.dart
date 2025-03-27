import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

class CutomTextFeild extends StatelessWidget {
  CutomTextFeild({
    super.key,
    this.hasvalidationrul,
    this.hasindecator,
    this.sufficas,
    this.validator,
    required this.controler,
    required this.hint,
    required this.label,
    required this.prefixicon,
    this.secure
  });

  bool? hasvalidationrul;
  bool? hasindecator;
  bool? sufficas;
  bool?secure;
  String hint;
  String label;
  IconData? prefixicon;

  String? Function(String?)? validator;

  TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            label,
            style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            child: FancyPasswordField(

              obscureText:secure==false?false:
                  (sufficas == false || sufficas == null) ? false : null,
              validator: validator,
              controller: controler,
              hasShowHidePassword: sufficas ?? false,
              style: TextstyleConst.texts16.copyWith(
                color: color.onSurface.withAlpha((.6 * 255).toInt()),
              ),
              showPasswordIcon:
                  sufficas == false ? null : customvisibleiocon(context, true),
              hidePasswordIcon:
                  sufficas == false ? null : customvisibleiocon(context, false),
              decoration: decoration(
                context,
                color,
                hint,
                prefixicon,

                validator,
              ),
              hasValidationRules: hasvalidationrul ?? false,
              hasStrengthIndicator: hasindecator ?? false,
              validationRules: {
                DigitValidationRule(),
                SpecialCharacterValidationRule(),
                MinCharactersValidationRule(8),
                MaxCharactersValidationRule(12),
              },

              strengthIndicatorBuilder: (strength) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.w,
                    vertical: 10.h,
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(5.r),
                    minHeight: 8.h,
                    color: calccolor(strength),

                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    value: strength,
                  ),
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
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green,
                                            radius: 10.r,
                                            child: Icon(
                                              Icons.done_outlined,
                                              size: 15.r,
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 11.w),
                                        Text(
                                          rule.name,
                                          style: TextstyleConst.texts16
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    )
                                    : Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  197,
                                                  196,
                                                  196,
                                                ),
                                            radius: 10.r,
                                          ),
                                        ),

                                        SizedBox(width: 12.w),
                                        Text(
                                          rule.name,
                                          style: TextstyleConst.texts16
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                          )
                          .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration decoration(
  context,
  color,
  String hint,

  IconData? prefixicon,

  dynamic validator,
) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
    prefixIcon:
        prefixicon != null
            ? Icon(
              prefixicon,
              size: 24.r,
              color: Theme.of(context).colorScheme.onSecondary,
            )
            : null,
    errorStyle: TextstyleConst.texts16.copyWith(
      color: Theme.of(context).colorScheme.error,
    ),
    hintText: hint,
    hintStyle: TextstyleConst.texts16.copyWith(color: color.onSecondary),

    border: OutlineInputBorder(
      borderSide: BorderSide(width: 1.2),
      borderRadius: BorderRadius.circular(15.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),

      borderSide: BorderSide(color: color.onSurface, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: color.onSurface, width: 1.1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: color.error, width: 1.1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: color.error, width: 2),
    ),
  );
}

customvisibleiocon(context, visible) {
  return Icon(
    visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
    size: 24.r,
    color: Theme.of(context).colorScheme.onSecondary,
  );
}

List<Color> listofcolors = [
  AppColors.errorcolor,
  AppColors.warningcolor,
  AppColors.primarycolor,
];

calccolor(val) {
  if (val < .25) {
    return listofcolors[0];
  }
  if (val <= .5) {
    return listofcolors[1];
  } else
    return listofcolors[2];
}

