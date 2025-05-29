import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/core/utiles/validation.dart';

import '../../../../core/component/custom_button.dart';
import '../../../../core/component/textfeild_custom.dart';
import '../widgets/datefeild_cutom_widget.dart';
import '../widgets/profile_image.dart';

class EdditprofileScreen extends StatefulWidget {
  const EdditprofileScreen({super.key});

  @override
  State<EdditprofileScreen> createState() => _EdditprofileScreenState();
}

class _EdditprofileScreenState extends State<EdditprofileScreen> {
  late TextEditingController namecontroler;
  late TextEditingController emailcontroler;
  late TextEditingController paswordcontroler;
  late TextEditingController phonecontroler;

  @override
  void initState() {
    namecontroler = TextEditingController(text: "mostafa salem");
    emailcontroler = TextEditingController(text: "mostafa@gmail.com");
    paswordcontroler = TextEditingController(text: "853456789");
    phonecontroler = TextEditingController(text: "0120082843");

    super.initState();
  }

  @override
  void dispose() {
    namecontroler.dispose();
    emailcontroler.dispose();
    phonecontroler.dispose();
    paswordcontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextstyleConst.texts22.copyWith(fontWeight: FontWeight.w600),
        ),
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withAlpha((.9 * 255).toInt()),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 10.h,),
                  ProfileImage(
                    image:
                        'https://th.bing.com/th/id/OIP.l2-Wn5-3R-XXhYJmFNl9-wHaHa?rs=1&pid=ImgDetMain',
                    onchanged: (String image) {},
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CutomTextFeild(
                      controler: namecontroler,
                      hint: '',
                      label: Apptrings.name,
                      prefixicon: null,
                      hasindecator: false,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CutomTextFeild(
                      validator: emailvalidation,
                      controler: emailcontroler,
                      hint: '',
                      label: Apptrings.email,
                      prefixicon: null,
                      hasindecator: false,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CutomTextFeild(
                      // secure: true,
                      validator: passwordvalidation,
                      sufficas: true,
                      controler: paswordcontroler,
                      hint: '',
                      label: Apptrings.password,
                      prefixicon: null,
                      hasindecator: true,
                      hasvalidationrul: true,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CutomTextFeild(
                      controler: phonecontroler,
                      hint: '',
                      label: Apptrings.phone,
                      prefixicon: null,
                      validator: checkempty,
                      hasindecator: false,
                    ),
                  ),

                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DateTimeFeildCustom(
                      intailalue: DateTime.now(),
                      onchanged: (DateTime? value) {},
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: customButton(
                      context,
                      text: Apptrings.savechanges,
                      onpress: () {},
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
