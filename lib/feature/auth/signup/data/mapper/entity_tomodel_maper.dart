
import '../../domain/entitys/signup_entity.dart';
import '../models/signupmoadel.dart';

extension EntityTomodelMaper on SignUpEntity {
  Signupmoadel tosignupmodel() {
    return Signupmoadel(email: email, password: password);
  }
}
