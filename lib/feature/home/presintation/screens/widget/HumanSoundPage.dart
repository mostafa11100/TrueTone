import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';

class HumanSoundPage extends StatefulWidget {
  const HumanSoundPage({super.key, required this.result});
  final HomeEntity result;

  @override
  State<HumanSoundPage> createState() => _HumanSoundPageState();
}

class _HumanSoundPageState extends State<HumanSoundPage> {
late  AnimatedTextController animatedTextController;
  @override
  void initState() {
    animatedTextController=AnimatedTextController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: screenSize.height * 0.24,
            bottom: 0,
            child: Image.asset(
              HumanSoundPage1,
              width: screenSize.width * 0.5,
              fit: BoxFit.fill,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.17),

                SizedBox(
                  height: 250.h,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedTextKit(
                        onFinished: ()
                      {
                        animatedTextController.pause();
                      },displayFullTextOnTap: true,totalRepeatCount: 4,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: Duration(milliseconds: 200),
                            Apptrings.Humansound,
                            textStyle: TextstyleConst.texts40.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.onprimary,
                              fontStyle: FontStyle.italic,
                            ),

                          ),

                        ],
                      ),
                      //SizedBox(height: screenSize.height * 0.1),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:25.w),
                        child: Text(
                          (widget.result.rate?? "95.22%").toString(),
                          style: TextstyleConst.texts24.copyWith(
                            color: AppColors.onprimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),

                // Text(
                //   Apptrings.Humansound,
                //   style: TextstyleConst.texts40.copyWith(
                //     fontWeight: FontWeight.w700,
                //     color: AppColors.onprimary,
                //     fontStyle: FontStyle.italic,
                //   ),
                // ),
                //
                // SizedBox(height: screenSize.height * 0.1),
                //
                // Text(
                //   (result.rate?? "95.22%").toString(),
                //   style: TextstyleConst.texts24.copyWith(
                //     color: AppColors.onprimary,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: screenSize.height * 0.19),

                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(screenSize.width * 0.13),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      Apptrings.continue1,
                      style: TextstyleConst.texts20.copyWith(
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
