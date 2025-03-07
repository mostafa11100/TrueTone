

import 'package:truetone/feature/auth/signin/data/model/signin_model.dart';

import '../../domain/entitys/signin_entity.dart';

extension MaperformentotyTomodel on SignInEntity

{
  SigninModel maptosigninmodel()
  {
    return SigninModel(email: email, password: password);
  }
}
