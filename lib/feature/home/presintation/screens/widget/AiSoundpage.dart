
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:truetone/core/Approuts/routs.dart';
import 'package:truetone/core/utiles/app_assets.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';

import '../../../domain/ entitys/homeentity_uploadfile.dart';

class AiSoundPage extends StatelessWidget {
  const AiSoundPage({super.key, required this.result});
  final HomeEntity result;
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
              aiSoundPage1,
              width: screenSize.width * 0.5,
              fit: BoxFit.fill,
            ),
          ),

         
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.21),

                SizedBox(
                  height: 280.h,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        onFinished: ()
                        {

                        },displayFullTextOnTap: true,totalRepeatCount: 4,
                        animatedTexts: [
                          TypewriterAnimatedText(speed: Duration(milliseconds: 150),

                            Apptrings.AIsound,
                            textStyle: TextstyleConst.texts42.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.onprimary,
                              fontStyle: FontStyle.italic,
                            ),

                          ),

                        ],
                      ),
                      //SizedBox(height: screenSize.height * 0.1),
                      Text(
                        (result.rate?? "").toString(),
                        style: TextstyleConst.texts28.copyWith(
                          color: AppColors.onprimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),


                    ],
                  ),
                ),

                SizedBox(height: screenSize.height * 0.18),

             
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouts.mainscreen);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(screenSize.width * 0.13),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      Apptrings.continue1,
                      style:
                          TextstyleConst.texts24.copyWith(fontWeight: FontWeight.w600,color: AppColors.primarycolor),
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