import 'package:truetone/features/auth/signup/data/models/signupmoadel.dart';
import 'package:truetone/features/auth/signup/domain/entitys/signup_entity.dart';

extension EntityTomodelMaper on SignUpEntity {
  Signupmoadel tosignupmodel() {
    return Signupmoadel(email: email, password: password);
  }
}
