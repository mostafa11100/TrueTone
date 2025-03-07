
class PasswordProccesModel
{

  String?email;
  String?password;
  String?otp;
  Map<String,dynamic>jsn={};
  PasswordProccesModel({this.email,this.password,this.otp});
  Map<String,dynamic> tojson()
  {
 email!=null?   jsn['email']=email:null;
 otp!=null?   jsn['code']=otp:null;
 password!=null?jsn['password']=password:null;
    return jsn;
  }
}
