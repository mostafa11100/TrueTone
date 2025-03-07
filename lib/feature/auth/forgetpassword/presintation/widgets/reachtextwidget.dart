
import 'package:go_router/go_router.dart';

import '../../../../../core/Approuts/routs.dart';
import '../../../../../core/component/textrich.dart';
import '../../../../../core/utiles/app_strings.dart';

reachtextwidget(context)
{
  return  richText(
    context,
    text1: Apptrings.rememberPassword ,
    text2: Apptrings.login,

    ontap: () {
      GoRouter.of(context).pushReplacement(AppRouts.signin);
    },
  );
}
