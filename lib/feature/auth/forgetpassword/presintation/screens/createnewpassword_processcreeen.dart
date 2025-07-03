import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/component/dialog.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/controler/create_new_password_procces_bloc.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/screens/createnew_password_screen.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/screens/sendtoemail_screen.dart';
import 'package:truetone/feature/auth/forgetpassword/presintation/screens/verifyeotp_screen.dart';

import '../../../../../core/component/custom_indecator.dart';
import '../../../../../core/component/custom_sniper.dart';
import '../../../../../core/utiles/app_strings.dart';
import '../widgets/customappBar.dart';

class CreatenewpasswordProcesscreeen extends StatefulWidget {
  const CreatenewpasswordProcesscreeen({super.key});

  @override
  State<CreatenewpasswordProcesscreeen> createState() =>
      _CreatenewpasswordProcesscreeenState();
}

class _CreatenewpasswordProcesscreeenState
    extends State<CreatenewpasswordProcesscreeen> {
  late final PageController _controller;
  int index = 0;

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        index = _controller.page!.toInt();
      });
    });
    super.initState();
  }

  List<String> listoftitles = [
    Apptrings.forgetpassword,
    Apptrings.vrifyemail,
    Apptrings.createnwpassword,
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        listoftitles[index],
        ontap: () {
          if (index > 0) {
            _controller.animateToPage(
              index - 1,
              duration: Duration(milliseconds: 50),
              curve: Curves.ease,
            );
          } else {
            GoRouter.of(context).pop();
          }
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          customindicator2(index),

          Expanded(
            child: BlocListener<
              CreateNewPasswordProccesBloc,
              CreateNewPasswordProccesState
            >(
              listener: (context, state) {
                if (state is CreateNewPasswordSuccessnewpassword) {
                  GoRouter.of(context).pop();
                  customsnackbar(
                    textcolor: Colors.white,
                    context: context,
                    color: Colors.green,
                    text: "password updated successfuly",
                    then: () {
                      GoRouter.of(context).pushReplacement(AppRouts.signin);
                    },
                  );
                }
                if (state is CreateNewPasswordLoading) {
                  loadingdialog(context);
                } else if (state is CreateNewPasswordSuccess) {
                  GoRouter.of(context).pop();
                  if (index < 2) {
                    _controller.animateToPage(
                      index + 1,
                      duration: Duration(milliseconds: 50),
                      curve: Curves.ease,
                    );
                  }
                } else if (state is CreateNewPasswordFail) {
                  GoRouter.of(context).pop();
                  customsnackbar(
                    color: Theme.of(context).colorScheme.error,
                    context: context,
                    text: state.error,
                    textcolor: Theme.of(context).colorScheme.onError,
                  );
                }
              },
              child: PageView(
                controller: _controller,
                //  physics: NeverScrollableScrollPhysics(),
                children: [
                  const SendCodeToEmailScreen(),
                  const VerifyeotpScreen(),
                  const CreatenewPasswordScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
