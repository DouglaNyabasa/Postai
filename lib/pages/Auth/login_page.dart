import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:postai/pages/Auth/signup_screen.dart';
import 'package:postai/pages/dashboard.dart';

import '../../commons/constants/app_color.dart';
import '../../commons/constants/sizes.dart';
import '../../commons/constants/spacing_styles.dart';
import '../../commons/widgets/divider.dart';
import '../../commons/widgets/header.dart';
import '../../commons/widgets/snackbar.dart';
import '../../commons/widgets/social_buttons.dart';
import '../../commons/widgets/textInputDecoration.dart';
import '../../services/auth/auth_services.dart';
import '../../services/auth/database_service.dart';
import '../../services/helper/helper_function.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  GlobalKey<FormState> _key = GlobalKey <FormState>();
  String errorMessage = '';
  bool _isLoading = false;
  AuthService authService = AuthService();
  String email = "";
  String password = "";
  var _isObscured;
  RegExp pass_validation = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String password){
    String _pass = password.trim();
    if(_pass.isEmpty){
      setState(() {
        password_strength=0;
      });
    }else if(_pass.length<6){
      setState(() {
        password_strength = 1/4;
      });

    }else if(_pass.length<=6){
      setState(() {
        password_strength = 2/4;
      });

    }else{
      if(pass_validation.hasMatch(_pass)){
        setState(() {
          password_strength = 2/4;
        });
      }else{
        return false;
      }
    }
    return false;

  }

  double password_strength =0;




  @override
  void initState(){
    super.initState();
    _isObscured = true;
  }
  void displayMessage(String message){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text(message),

        ));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: _isLoading? Center(  child: CircularProgressIndicator(color: AppColor.secondary2,),): SingleChildScrollView(

          child: Padding(
              padding:TSpacingStyles.paddingWIthAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              LogInHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Form
                  (
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: TextStyle(
                              color: Colors.black),
                          decoration:  InputDecoration(
                            prefixIcon: Icon( Icons.email_outlined, color: Colors.black,) ,

                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(
                                color: Colors.black
                            ),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.solid)),
                          ) ,
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                          validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!)? null : "Please Enter a Valid Email";
                          },
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          obscureText: _isObscured,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: TextStyle(
                              color: Colors.black),
                          decoration:  InputDecoration(
                            prefixIcon: Icon( Iconsax.password_check, color: Colors.black,) ,
                            suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _isObscured =! _isObscured;
                                  });
                                }, icon: _isObscured ? Icon(Icons.remove_red_eye_sharp, color: Colors.black,) :Icon(Iconsax.eye_slash, color: Colors.black,)
                            ),

                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
                            hintStyle: TextStyle(
                                color: Colors.black
                            ),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.solid)),
                          ) ,

                          onChanged: (value){
                            setState(() {
                              _key.currentState!.validate();
                            });
                          },
                        ),
                        Center(child: Text(errorMessage),),

                        // reusablePasswordTextField('Password', Iconsax.password_check, true, passwordTextController, Iconsax.eye_slash),
                        const SizedBox(height: 20,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Checkbox(value: true, onChanged: (value){}),
                        //         Text("Remember Me",style: TextStyle(color: AppColor.gray50),)
                        //       ],
                        //     ),
                        //     TextButton(onPressed: (){}, child: Text("Forget Password")),
                        //   ],
                        // ),
                        const SizedBox(height: SizeConfig.spacingBetween,),
                        Container(
                          padding: EdgeInsets.only(top: 3,left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: const Border(
                                bottom: BorderSide(color: Colors.white),
                                top: BorderSide(color: Colors.white),
                                left: BorderSide(color: Colors.white),
                                right: BorderSide(color: Colors.white),
                              )
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: (){
                              login();

                            },

                            color: AppColor.secondary2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Text("Sign in", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text.rich(
                          TextSpan(
                              text:   "Don\'t have an Account ?   ",
                              style:
                              TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                              ),
                              children: <TextSpan>[

                                TextSpan(
                                  text: "Register here !",
                                  style:
                                  TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap=(){
                                    nextScreen(context, const SignUpScreen());
                                  }
                                )
                              ]
                          ),
                        ),
                      ],
                    )
                ),
              ),

            ],
          ),),
        )
    );
  }
  login() async{

    if(_key.currentState!.validate()){
      showDialog(context: context,
          builder: (context)=>  Center(
            child: CircularProgressIndicator(color: AppColor.secondary2,),
          ));

      try{
        await authService.logInUserWithEmailAndPassword(email, password).then((value) async{
          if(value == true){

            QuerySnapshot snapshot = await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);
            await HelperFunctions.saveUserLoggedInStatus(true);
            await HelperFunctions.saveUserEmailSF(email);
            await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
            nextScreenReplace(context, const Dashboard());
          }
          else{
            showSnackBar(context, value , Colors.redAccent);
            Navigator.pop(context);
            setState(() {
              _isLoading= false;
            });
          }
        });
        errorMessage = '';
      }on FirebaseAuthException catch (e){
        errorMessage = e.message!;
        Get.snackbar("Required",e.message.toString(),
            snackPosition:SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondary50,
            colorText:AppColor.backgroundColorDark,
            icon:Icon(Icons.warning_amber_rounded,color: Colors.black,size: 30,)
        );

      }
      setState(() {
        _isLoading= false;
      });

    }


  }
}
