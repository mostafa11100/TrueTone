// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Cashhelper {
  SharedPreferences? sharedPreferences;

  Cashhelper(shared) {
    sharedPreferences = shared;
  }

  static chachhelperinit() async {
    SharedPreferences? s;
    s = await SharedPreferences.getInstance();
    return Cashhelper(s);
  }

  setusertoken(token) {
    sharedPreferences!.setString("token", token);
  }

  setvisit() {
    sharedPreferences!.setBool("visit", true);
  }

  setlanguage(lang) {
    sharedPreferences!.setString("lang", lang);
  }

  setlocation(location) {
    sharedPreferences!.setString("location", location);
  }

  setuserlogin() {
    sharedPreferences!.setBool("login", true);
  }

  setuserinfo(info) {
    sharedPreferences!.setString("userinfo", jsonEncode(info));
  }

  setuserlocalization(local) {
    sharedPreferences!.setString("local", local);
  }

  String? getusertoken() {
    return sharedPreferences!.getString("token");
  }  String? getrefreshtoken() {
    return sharedPreferences!.getString("refreshtoken");
  }

  void setemail(email) {
    sharedPreferences!.setString("email", email);
  }
  void setrefreshtoken(rfrshtoken) {
    sharedPreferences!.setString("refreshtoken", rfrshtoken);
  }

  String? getemail() {
    return sharedPreferences!.getString("email");
  }

  String? getlocation() {
    return sharedPreferences!.getString("location");
  }

  String? getlanguage() {
    return sharedPreferences!.getString("lang");
  }

  setotp(otp) {
    sharedPreferences!.setString("otp", otp);
  }

  String? getotp() {
    return sharedPreferences!.getString("otp");
  }

  Map<String, dynamic> getuserinfo() {
    return jsonDecode(sharedPreferences!.getString("userinfo")!);
  }

  bool? getuserlogin() {
    return sharedPreferences!.getBool("login") ?? false;
  }

  bool? gituservisit() {
    return sharedPreferences!.getBool("visit");
  }
}
