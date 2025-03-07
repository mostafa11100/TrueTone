import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/textfeild_custom.dart';
import '../../../../../core/utiles/app_strings.dart';
import '../../../../../core/utiles/validation.dart';

newPaswwordFeild(formkey,passwordcontroler,confirmpassword)

 {
   return  Form(key: formkey,child: Column
     (
     children: [
       CutomTextFeild(
         hasvalidationrul: true,

         hint: Apptrings.enterpassword,
         label: Apptrings.password,
         hasindecator: true,

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
   ));
 }
