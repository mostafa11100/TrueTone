

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/textrich.dart';
import '../../../../../core/utiles/app_strings.dart';
import '../../../../../core/utiles/app_textstyle.dart';
import '../../../verify_email/presintaion/widgets.dart';
import '../controler/create_new_password_procces_bloc.dart';

class VerifyeotpScreen extends StatefulWidget {
  const VerifyeotpScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyeotpScreen> createState() => _VerifyEmalScreenState();
}
class _VerifyEmalScreenState extends State<VerifyeotpScreen> {

  String otp="";

  checkvaidation()
  {
    return !(otp.length<4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        title: Text(
          Apptrings.vrifyemail,
          style: TextstyleConst.texts22.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
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
                widget.email,
                style: TextstyleConst.texts20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(height: 30.h),
            cutomotp(context, (verify)
            {setState(() {
              otp=verify;
            });

            }),
            SizedBox(height: 30.h),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: customButton(
                context,
                onpress:!checkvaidation()?null: ()
                {

                  BlocProvider.of<CreateNewPasswordProccesBloc>(context).add(VerifyOTP(otp));
                },
                text: Apptrings.verify,
              ),
            ),
            SizedBox(height: 28.h),
            richText(
              context,
              ontap: ()
              {
                BlocProvider.of<CreateNewPasswordProccesBloc>(context).add(SendOTP(widget.email));
              },
              text1: Apptrings.iddnthavecode,
              text2: Apptrings.Resend,
              fontstyle: FontStyle.normal,
            ),
          ],
        ),
      ),
    );
  }
}
