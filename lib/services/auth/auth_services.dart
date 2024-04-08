
import 'package:firebase_auth/firebase_auth.dart';

import '../helper/helper_function.dart';
import 'database_service.dart';

class AuthService{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future logInUserWithEmailAndPassword(String email, String password) async{

    try{

      User user =  (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;

      if(user!= null){
        return true;
      }
    }on FirebaseAuthException catch(e){
      return e.message
      ;
    }

  }


  Future registerUserWithEmailAndPassword(String fullName, String phoneNumber, String email, String password) async{

    try{

      User user =  (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;




      if(user!= null){
        await DatabaseService(uid: user.uid).savingUserData(fullName, email, phoneNumber);
        return true;
      }
    }on FirebaseAuthException catch(e){
      return e.message
      ;
    }

  }

  Future signOut() async{
    try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserNameSF("");
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserPhoneNumberSF("");
      await HelperFunctions.saveUserAddressSF("");
      await HelperFunctions.saveUserPostOfficeBoxSF("");
      await firebaseAuth.signOut();
    }catch (e){
      return null;
    }
  }

}