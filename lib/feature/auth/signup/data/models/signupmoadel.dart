
import '../../domain/entitys/signup_entity.dart';

class Signupmoadel extends SignUpEntity {
  final String? name;
  final String? image;
  final String? address;
  final String? phone;

  const Signupmoadel({
    super.email,
    super.password,
    this.name,
    this.address,
    this.image,
    this.phone,
  });

  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};

    email != null ? json['email'] = email : null;
    password != null ? json['password'] = password : null;
    image != null ? json['image'] = image : null;
    address != null ? json['addres'] = address : null;
    phone != null ? json['phone'] = phone : null;
    return json;
  }
}
