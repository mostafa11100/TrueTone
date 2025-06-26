import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

import '../../../core/component/custom_indecator.dart';
import '../../../core/utiles/app_assets.dart';
import '../../../core/utiles/app_strings.dart';

class Onbordingbady extends StatefulWidget {
  const Onbordingbady({super.key});

  @override
  State<Onbordingbady> createState() => _OnbordingbadyState();
}

class _OnbordingbadyState extends State<Onbordingbady> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            Expanded(
              //  height: MediaQuery.of(context).size.height / 1.8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          onp1asset,
                          // height: MediaQuery.of(context).size.height * .33,
                          // width: MediaQuery.of(context).size.width * .6,
                        ),
                        SizedBox(height: 20.h),

                        Center(
                          child: Text(
                            Apptrings.dfrntbtwen,
                            style: TextstyleConst.texts28.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            Apptrings.relandfake,
                            style: TextstyleConst.texts28.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(onp2asset),
                        Container(height: 20.h),
                        Image.asset(onp22asset),
                        Container(height: 30.h),

                        Center(
                          child: Text(
                            Apptrings.dtctartfcialvice,
                            style: TextstyleConst.texts28.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            Apptrings.protctyourlf,
                            style: TextstyleConst.texts28.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(onp3asset),

                      Container(height: 64.h),

                      Center(
                        child: Text(
                          Apptrings.quicidnfcation,
                          style: TextstyleConst.texts28.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        Apptrings.soundsourceai,
                        style: TextstyleConst.texts28.copyWith(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            customindicator2(index),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: customButton(
                      context,
                      onpress: () {
                        if (index == 2) {
                          GoRouter.of(context).pushReplacement(AppRouts.signup);
                        }
                        _pageController.jumpToPage(index + 1);
                      },
                      text: index == 2 ? Apptrings.gettstart : Apptrings.next,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .2),
          ],
        ),
      ),
    );
  }
}
