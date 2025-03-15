// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class Cashhelper {
  Future<void> setuserid(id) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("id", id);
  }

  Future<void> setlanguage(lang) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("lang", lang);
  }

  Future<void> setlocation(location) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("location", location);
  }

  Future<void> setuserlogin() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setBool("login", true);
  }

  Future<void> setuserinfo(info) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("userinfo", jsonEncode(info));
  }

  Future<void> setuserlocalization(local) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("local", local);
  }

  Future<String?> getuserid() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    return sharedPreferences.getString("id");
  }


  Future<void> setemail(email) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("email", email);
  }
  Future<String?> getemail() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    return sharedPreferences.getString("email");
  }
  Future<String?> getlocation() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    return sharedPreferences.getString("location");
  }

  Future<String?> getlanguage() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    return sharedPreferences.getString("lang");
  }
  Future<void> setotp(otp) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("otp", otp);
  }
  Future<String?> getotp() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    return sharedPreferences.getString("otp");
  }

  Future<Map<String, dynamic>> getuserinfo() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();

    return jsonDecode(sharedPreferences.getString("userinfo")!);
  }

  Future<bool?> getuserlogin() async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();

    return sharedPreferences.getBool("login");
  }
}