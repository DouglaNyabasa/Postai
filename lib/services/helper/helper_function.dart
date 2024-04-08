import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class HelperFunctions{

  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhoneNumberKey = "USERPHONENUMBERKEY";
  static String userAddressKey = "USERADDRESSKEY";
  static String userPostOfficeBoxKey = "USERPOSTOFFICEBOXKEY";

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(userLoggedInKey,isUserLoggedIn);
  }
  static Future<bool> saveUserNameSF(String userName )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userNameKey, userName);
  }
  static Future<bool> saveUserEmailSF(String userEmail )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userEmailKey,userEmail);
  }
  static Future<bool> saveUserPhoneNumberSF(String phoneNumber )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userPhoneNumberKey,phoneNumber);
  }
  static Future<bool> saveUserAddressSF(String address )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userAddressKey,address);
  }
  static Future<bool> saveUserPostOfficeBoxSF(String postOfficeBox )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userPostOfficeBoxKey,postOfficeBox);
  }


  static Future<bool?> getUserLoggedInStatus( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
  static Future<String?> getUserNameFromSF( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
  static Future<String?> getUserEmailFromSF( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<String?> getUserPhoneNumberFromSF( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPhoneNumberKey);
  }

  static Future<String?> getUserAddressFromSF( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userAddressKey);
  }
  static Future<String?> getUserPostOfficeBoxFromSF( )async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPostOfficeBoxKey);
  }



  // static double getAppBarHeight(){
  //   return
  // }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  static void showAlert(String title , String message) {
    showDialog(context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"))
            ],
          );
        }
    );
  }

}