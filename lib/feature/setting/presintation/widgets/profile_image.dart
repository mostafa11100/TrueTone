import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truetone/core/utiles/app_colors.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key, required this.image, required this.onchanged});

  final String image;
  final Function(String image) onchanged;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  late String image_path;

  bool networksource = false;

  @override
  void initState() {
    image_path = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 150.h,
      child: Stack(
        children: [
          imageofprofile(context, image_path, networksource),
          Positioned(
            bottom: 8.h,
            right: 10.w,
            child: cameraicon(context, () async {
              final ImagePicker picker = ImagePicker();
              XFile? xf = await picker.pickImage(source: ImageSource.gallery);
              if (xf != null) {
                setState(() {
                  image_path = xf.path;
                  networksource = true;
                  widget.onchanged(image_path);
                });
              }
              //  picker.pickMultiImage(limit: 2);
            }),
          ),
        ],
      ),
    );
  }
}

cameraicon(context, ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 38.h,
      width: 38.w,
      decoration: BoxDecoration(
        color: AppColors.onprimary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.onSurface.withAlpha((.8 * 255).toInt()),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.camera_alt,
          size: 22.r,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
  );
}

imageselected(context, image, bool network) {
  return network != true
      ? handlenetworkimage(
        height: 143.h,
        width: 143.h,
        image: image,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.secondary.withAlpha((.8 * 255).toInt()),
        ),
      )
      : hadlefileimage(context: context, image: image);
}

imageofprofile(context, image, bool network) {
  return Container(
    height: 150.h,
    width: 150.w,
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 6,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: imageselected(context, image, network),
    ),
  );
}

handlenetworkimage({image, shape, height, width, border}) {
  return CachedNetworkImage(
    imageUrl: image,
    height: height,
    width: width,
    imageBuilder:
        (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: shape,
            border: border,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
    placeholder: (context, url) {
      return CircleAvatar(
        radius: 40.r,
        backgroundColor: AppColors.primaryfixed,
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

hadlefileimage({context, image}) {
  return Container(
    height: 143.h,
    width: 143.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Theme.of(
          context,
        ).colorScheme.secondary.withAlpha((.8 * 255).toInt()),
      ),
      image: DecorationImage(fit: BoxFit.cover, image: FileImage(File(image))),
    ),
  );
}
