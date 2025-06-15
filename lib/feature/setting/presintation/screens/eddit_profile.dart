import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:truetone/core/network/api_servise.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/core/utiles/app_strings.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';
import 'package:truetone/core/utiles/validation.dart';
import 'package:truetone/core/component/custom_button.dart';
import 'package:truetone/core/component/textfeild_custom.dart';
import 'package:truetone/feature/setting/date/model.dart';
import 'package:truetone/feature/setting/date/rebo/homereboimp.dart';
import 'package:truetone/feature/setting/presintation/widgets/datefeild_cutom_widget.dart';
import 'package:truetone/feature/setting/presintation/widgets/profile_image.dart';
import 'package:truetone/feature/setting/presintation/manger/update/updataprofile_cubit.dart';
import 'package:truetone/feature/setting/presintation/manger/update/updataprofile_state.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfile profile;

  const EditProfileScreen({super.key, required this.profile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController countryController;
  late TextEditingController phoneController;
  late DateTime birthDate;
  File? pickedImage;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile.name);
    emailController = TextEditingController(text: widget.profile.email);
    countryController = TextEditingController(text: widget.profile.country);
    phoneController = TextEditingController(text: widget.profile.phoneNumber);
    birthDate = widget.profile.dateOfBirth;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit(HomeRepoImpl(ApiService(Dio()))),
      child: Scaffold(
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
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha((.9 * 255).toInt()),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
              debugPrint("🔄 Listener received state: $state");

              if (state is UpdateProfileSuccess) {
              
          
                ScaffoldMessenger.of(context).showSnackBar(
                  
                  SnackBar(
                    duration: Duration(milliseconds: 200),
                    backgroundColor: AppColors.primarycolor,
                    content: Text("Profile updated successfully!",style: TextStyle(color: Colors.white),)),
                );
                Navigator.pop(context, state.profile);
              
              } else if (state is UpdateProfileFailure) {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(15.0.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ProfileImage(
                          image: pickedImage != null
                              ? pickedImage!.path
                              : widget.profile.profileImageUrl,
                          onchanged: (String imagePath) {
                            debugPrint("📸 Image picked: $imagePath");
                            setState(() {
                              pickedImage = File(imagePath);
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        CutomTextFeild(
                          controler: nameController,
                          hint: '',
                          label: Apptrings.name,
                          prefixicon: null,
                          hasindecator: false,
                          validator: checkempty,
                        ),
                        SizedBox(height: 10.h),
                        CutomTextFeild(
                          controler: emailController,
                          hint: '',
                          label: Apptrings.email,
                          prefixicon: null,
                          hasindecator: false,
                          validator: emailvalidation,
                        ),
                        SizedBox(height: 10.h),
                        CutomTextFeild(
                          controler: countryController,
                          hint: '',
                          label: Apptrings.country,
                          prefixicon: null,
                          validator: checkempty,
                        ),
                        SizedBox(height: 10.h),
                        CutomTextFeild(
                          controler: phoneController,
                          hint: '',
                          label: Apptrings.phone,
                          prefixicon: null,
                          validator: checkempty,
                          hasindecator: false,
                        ),
                        SizedBox(height: 10.h),
                        DateTimeFeildCustom(
                          intailalue: birthDate,
                          onchanged: (DateTime? value) {
                            if (value != null) {
                              debugPrint("📅 Date changed: $value");
                              birthDate = value;
                            }
                          },
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: double.infinity,
                          child: customButton(
                            context,
                            text: Apptrings.savechanges,
                            onpress: () {
                      

                              if (_formKey.currentState?.validate() ?? false) {
                               

                                context.read<UpdateProfileCubit>().updateProfile(
                                      name: nameController.text,
                                      email: emailController.text,
                                      country: countryController.text,
                                      phoneNumber: phoneController.text,
                                      dateOfBirth: birthDate,
                                      profileImage: pickedImage?.path ?? widget.profile.profileImageUrl,
                                    );
                              } else {
                              }
                            },
                          ),
                        ),
                        if (state is UpdateProfileLoading) ...[
                          SizedBox(height: 15.h),
                          CircularProgressIndicator(),
                      
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
