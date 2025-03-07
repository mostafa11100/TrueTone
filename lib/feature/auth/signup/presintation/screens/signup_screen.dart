import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/component/dialog.dart';
import 'package:truetone/core/component/divider.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/core/utiles/validation.dart';
import 'package:truetone/feature/auth/signup/presintation/controler/cubit/sign_up_cubit.dart';

import '../../../../../core/component/custom_sniper.dart';
import '../../../../../core/component/sign_collection_providers.dart';
import '../../../../../core/component/textfeild_custom.dart';
import '../../../../../core/component/textrich.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController emailcontroler;
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
    emailcontroler = TextEditingController();
    formkey = GlobalKey<FormState>();
    passwordcontroler = TextEditingController();

    confirmpassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailcontroler.dispose();
    passwordcontroler.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          Apptrings.createacount,
          style: TextstyleConst.texts22.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state)
        {
          if (state is SignUpFail)
            {
              customsnackbar(
                color: Theme.of(context).colorScheme.error,
                context: context,
                text: state.eror,
                textcolor: Theme.of(context).colorScheme.onError,
              );
            }
          if (state is SignUpSucces)
            {
              GoRouter.of(context).pushReplacement(AppRouts.verifyemalScreen);
            }
          else
            loadingdialog(context);
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CutomTextFeild(
                          hasvalidationrul: false,
                          validator: emailvalidation,
                          hasindecator: false,
                          hint: Apptrings.enteremail,
                          label: Apptrings.email,
                          controler: emailcontroler,

                          prefixicon: Icons.email_outlined,
                          sufficas: false,
                        ),

                        SizedBox(height: 15.h),

                        CutomTextFeild(
                          hasvalidationrul: null,

                          hint: Apptrings.enterpassword,
                          label: Apptrings.password,
                          hasindecator: null,

                          controler: passwordcontroler,
                          validator: passwordvalidation,
                          prefixicon: Icons.lock_outlined,
                          sufficas: true,
                        ),

                        SizedBox(height: 15.h),
                        CutomTextFeild(
                          hint: Apptrings.repeatpassword,
                          label: Apptrings.confirmpasssword,
                          controler: confirmpassword,
                          prefixicon: Icons.lock_outlined,
                          validator: (text) {
                            return passwordconfirm(
                              text.toString(),
                              passwordcontroler.text,
                            );
                          },

                          sufficas: true,
                          hasvalidationrul: null,
                          hasindecator: null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 33.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: customButton(
                      context,
                      onpress: () {
                        if (checkvalidation()) {
                          BlocProvider.of<SignUpCubit>(context).excute(
                            email: emailcontroler.text,
                            password: passwordcontroler.text,
                          );
                        }
                      },
                      text: Apptrings.next,
                    ),
                  ),

                  SizedBox(height: 28.h),
                  cutomdivider(context, text: Apptrings.dividertextregistr),

                  SizedBox(height: 35.h),
                  signcollectionproviders(context),
                  SizedBox(height: 38.h),
                  richText(
                    context,
                    text1: Apptrings.alreadyhaveacount,
                    text2: Apptrings.login,
                    ontap: () {
                      GoRouter.of(context).pushReplacement(AppRouts.signin);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
