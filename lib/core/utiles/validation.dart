
import 'package:email_validator/email_validator.dart';
import 'package:password_validator_package/password_validator_package.dart';
import 'package:truetone/core/utiles/app_strings.dart';

String? emailvalidation(email)

{
  if(!EmailValidator.validate(email))
    {
      return Apptrings.notvalidemail;
    }
    return null;
}


String? passwordvalidation(password)

{

  if( !PasswordValidator.validatePassword(password))
    {
      return Apptrings.errorpassword;
    }
  return null;
}


String? passwordconfirm(String pass1,pass2)
{

  if(pass1.compareTo(pass2)!=0)
    {
      return  Apptrings.confirmpasssword;
    }
  return null;
}




String? checkempty(String? text)
{

  if (text!=null && text.isEmpty) {
  return  Apptrings.cantbeepty;
  }
  return null;
}

