import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class elementofindecator extends StatelessWidget {
  final bool actaive;

  const elementofindecator({super.key, required this.actaive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 5.h,
      width:  30 .w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color:
            actaive
                ? Color(0xff2D3ECF)
                : const Color.fromARGB(235, 158, 158, 158),
      ),
    );
  }
}

customindicator2(index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      elementofindecator(actaive: index == 0),
      SizedBox(width: 5.w),
      elementofindecator(actaive: index == 1),
      SizedBox(width: 5.w),
      elementofindecator(actaive: index == 2),
    ],
  );
}
