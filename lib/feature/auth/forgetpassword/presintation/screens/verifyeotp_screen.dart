import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/helper/shared_pref.dart';

import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/textrich.dart';
import '../../../../../core/di/si.dart';
import '../../../../../core/utiles/app_strings.dart';
import '../../../../../core/utiles/app_textstyle.dart';
import '../../../verify_email/presintaion/widgets.dart';
import '../controler/create_new_password_procces_bloc.dart';

class VerifyeotpScreen extends StatefulWidget {
  const VerifyeotpScreen({super.key});

  @override
  State<VerifyeotpScreen> createState() => _VerifyEmalScreenState();
}

class _VerifyEmalScreenState extends State<VerifyeotpScreen> {
  String otp = "";

  checkvaidation() {
    return !(otp.length < 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Opacity(
                opacity: .9,
                child: Text(
                  Apptrings.sendedcode,
                  style: TextstyleConst.texts20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Opacity(
                opacity: .9,
                child: Text(
                  sl<Cashhelper>().getemail() ?? "",
                  style: TextstyleConst.texts20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              cutomotp(context, (verify) {
                setState(() {
                  otp = verify;
                });
              }),
              SizedBox(height: 30.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: customButton(
                  context,
                  onpress:
                      !checkvaidation()
                          ? null
                          : () {
                            //1
                            //context.read<CreateNewPasswordProccesBloc>().add(VerifyOTP(otp));

                            BlocProvider.of<CreateNewPasswordProccesBloc>(
                              context,
                            ).add(VerifyOTP(otp));
                          },
                  text: Apptrings.verify,
                ),
              ),
              SizedBox(height: 28.h),
              richText(
                context,
                ontap: () {
                  BlocProvider.of<CreateNewPasswordProccesBloc>(
                    context,
                  ).add(SendOTP(sl<Cashhelper>().getemail()!));
                },
                text1: Apptrings.iddnthavecode,
                text2: Apptrings.Resend,
                fontstyle: FontStyle.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
