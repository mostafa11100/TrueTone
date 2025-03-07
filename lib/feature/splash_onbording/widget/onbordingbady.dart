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
        padding:  EdgeInsets.all(20.0.w),
        child: Column(
          children: [
            Expanded(
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
                          height: MediaQuery.of(context).size.height * .33,
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                        Container(height: 10.h),

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
                        Image.asset(onp2asset, height: 200.h),
                        Image.asset(onp3asset, height: 70.h),
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
                        Image.asset(
                          onp1asset,
                          height: MediaQuery.of(context).size.height * .33,
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                        Container(height: 10.w),

                        Center(
                          child: Text(
                            Apptrings.quicidnfcation,
                            style: TextstyleConst.texts28.copyWith(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            Apptrings.soundsourceai,
                            style: TextstyleConst.texts28.copyWith(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            customindicator2(index),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     customindicator(actaive: index==0),
            //     SizedBox(width: 5.w,),
            //      customindicator(actaive: index==1),
            //           SizedBox(width: 5.w,),
            //       customindicator(actaive: index==2),
            //
            // ],),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.only(bottom: 5.h, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                width:MediaQuery.of(context).size.width*.8,
                    child: customButton(context, onpress: () {
                      if (index == 2) {
                        GoRouter.of(context).pushReplacement(AppRouts.signup);
                      }
                      _pageController.jumpToPage(index + 1);
                    }, text:  index == 2 ? Apptrings.gettstart : Apptrings.next,),
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
