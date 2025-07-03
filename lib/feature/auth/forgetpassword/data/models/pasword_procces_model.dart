class PasswordProccesModel {
  String? email;
  String? password;

  String? newpassword;
  String? confirmpassword;
  String? otp;
  Map<String, dynamic> jsn = {};
  PasswordProccesModel({
    this.email,
    this.password,
    this.newpassword,
    this.confirmpassword,
    this.otp,
  });
  Map<String, dynamic> tojson() {
    email != null ? jsn['email'] = email : null;
    otp != null ? jsn['otp'] = otp : null;
    password != null ? jsn['password'] = password : null;
    newpassword != null ? jsn['newPassword'] = newpassword : null;
    confirmpassword != null
        ? jsn['confirmNewPassword'] = confirmpassword
        : null;

    return jsn;
  }
}
