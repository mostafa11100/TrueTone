
import 'package:flutter/material.dart';

import '../../../../../core/component/textfeild_custom.dart';
import '../../../../../core/utiles/app_strings.dart';
import '../../../../../core/utiles/validation.dart';

customEmailFeild(_emailcontroller)

{
  return  CutomTextFeild(
    hasvalidationrul: false,
    validator: checkempty,
    hasindecator: false,
    hint: Apptrings.enteremail,
    label: Apptrings.email,
    controler: _emailcontroller,

    prefixicon: Icons.email_outlined,
    sufficas: false,
  );

}