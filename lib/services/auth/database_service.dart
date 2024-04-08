import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});


  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future savingUserData(String fullName, String email, String phoneNumber) async{
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      // "address": address,
      // "postOfficeBox": postOfficeBox,
    });
  }

  Future gettingUserData(String email) async{
    QuerySnapshot snapshot = await userCollection.where("email",isEqualTo: email).get();
    return snapshot;
  }
}