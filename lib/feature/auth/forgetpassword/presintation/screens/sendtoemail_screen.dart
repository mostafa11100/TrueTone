import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

import '../controler/create_new_password_procces_bloc.dart';
import '../widgets/custom_emailfeild.dart';
import '../widgets/customappBar.dart';
import '../widgets/reachtextwidget.dart';

class SendCodeToEmailScreen extends StatefulWidget {
  const SendCodeToEmailScreen({super.key});


  @override
  State<SendCodeToEmailScreen> createState() => _SendCodeToEmailScreenState();
}

class _SendCodeToEmailScreenState extends State<SendCodeToEmailScreen> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> formkey;
checkvalidatio()
{
  return formkey.currentState!.validate();
}

  @override
  void initState() {
    formkey = GlobalKey<FormState>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 40.h),
              Text(
                Apptrings.enteryouemailtosendcode,
                style: TextstyleConst.texts20,
              ),
              SizedBox(height: 25.h),
              Form(key: formkey, child: customEmailFeild(_controller)),
              SizedBox(height: 30.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: customButton(
                  context,
                  onpress: () {
                    if(checkvalidatio()) {
                      BlocProvider.of<CreateNewPasswordProccesBloc>
                      (
                      context,
                    ).add(SendOTP(_controller.text));
                    }
                  },
                  text: Apptrings.sendCode,
                ),
              ),
              SizedBox(height: 300.h),

              reachtextwidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
