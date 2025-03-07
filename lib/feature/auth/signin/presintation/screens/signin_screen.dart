import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/auth/signin/presintation/controler/signin_cubit.dart';

import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/dialog.dart';
import '../../../../../core/component/divider.dart';
import '../../../../../core/component/sign_collection_providers.dart';
import '../../../../../core/component/textfeild_custom.dart';
import '../../../../../core/component/textrich.dart';
import '../../../../../core/utiles/validation.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailcontroller;

  late final TextEditingController _passwordcontroler;

  late final GlobalKey<FormState> formkey;

  bool checkvalidation() {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroler = TextEditingController();
    formkey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          Apptrings.login2,
          style: TextstyleConst.texts22.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  CutomTextFeild(
                    hasvalidationrul: false,
                    validator: checkempty,
                    hasindecator: false,
                    hint: Apptrings.enteremail,
                    label: Apptrings.email,
                    controler: _emailcontroller,

                    prefixicon: Icons.email_outlined,
                    sufficas: false,
                  ),

                  CutomTextFeild(
                    hasvalidationrul: null,

                    hint: Apptrings.enterpassword,
                    label: Apptrings.password,
                    hasindecator: null,

                    controler: _passwordcontroler,
                    validator: checkempty,
                    prefixicon: Icons.lock_outlined,
                    sufficas: true,
                  ),
                  SizedBox(height: 10.h),
                  BlocConsumer<SigninCubit, SigninState>(
                    listener: (context, state) {
                      if (state is SigninLoading) {
                        loadingdialog(context);
                      }

                      if (state is SigninSuccess) {
                        GoRouter.of(context).push(AppRouts.app_home);
                      }
                    },
                    builder: (context, state) {
                      if (state is SigninFail) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0.h, left: 10.w),
                            child: Text(
                              state.error,
                              style: TextstyleConst.texts16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        );
                      } else
                        return SizedBox();
                    },
                  ),
                  SizedBox(height: 35.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: customButton(
                      context,
                      onpress: () {
                        if (checkvalidation()) {
                          SigninCubit.blocbrovider(context).axcute(
                            email: _emailcontroller.text,
                            password: _passwordcontroler.text,
                          );
                        }
                      },
                      text: Apptrings.next,
                    ),
                  ),

                  SizedBox(height: 28.h),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      GoRouter.of(context).push(AppRouts.forgetpassword);
                    },
                    child: Text(
                      Apptrings.forgetpassword,
                      style: TextstyleConst.texts16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),
                  cutomdivider(context, text: Apptrings.orloginwith),

                  SizedBox(height: 40.h),

                  signcollectionproviders(context),
                  SizedBox(height: 45.h),
                  richText(
                    context,
                    text1: Apptrings.donthaveacount,
                    text2: Apptrings.signup,
                    ontap: () {
                      GoRouter.of(context).pushReplacement(AppRouts.signup);
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
