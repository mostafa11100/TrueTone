import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/controler/create_new_password_procces_bloc.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/widgets/customappBar.dart';

import '../../../../../core/component/custom_button.dart';
import '../widgets/newpassword_feilds.dart';

class CreatenewPasswordScreen extends StatefulWidget {
  const CreatenewPasswordScreen({super.key});

  @override
  State<CreatenewPasswordScreen> createState() =>
      _CreatenewPasswordScreenState();
}

class _CreatenewPasswordScreenState extends State<CreatenewPasswordScreen> {
  late TextEditingController passwordcontroler;
  late TextEditingController confirmpassword;
  late GlobalKey<FormState> formkey;

  bool checkvalidation() {
    bool formvalid = formkey.currentState!.validate();

    if (formvalid) {
      return true;
    } else {
      return false;
    }
  }

  bool visible = false;

  @override
  void initState() {
    formkey = GlobalKey<FormState>();
    passwordcontroler = TextEditingController();

    confirmpassword = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              newPaswwordFeild(formkey,passwordcontroler, confirmpassword),

              SizedBox(height: 40.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: customButton(
                  context,
                  onpress: () {

                    if (checkvalidation()) {
                      BlocProvider.of<CreateNewPasswordProccesBloc>(
                        context,
                      ).add(NewPassword(passwordcontroler.text));
                    }
                  },
                  text: Apptrings.sendCode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
