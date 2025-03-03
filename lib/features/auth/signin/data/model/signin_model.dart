import 'package:truetone/features/auth/signin/domain/entitys/signin_entity.dart';

class SigninModel extends SignInEntity {
  // if you want to update in future
  const SigninModel({required super.email, required super.password});
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> json = {};
    email != null ? json['email'] = email : null;
    password != null ? json['password'] = password : null;
    return json;
  }
}
