class UserModel{
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? address;
  final String? postOfficeBox;


  const UserModel(
 {
   this.id,
   this.fullName,
   this.email,
   this.phoneNumber,
   this.password,
   this.address,
   this.postOfficeBox,
 });

  toJson(){
    return{
      "FullName":fullName,
      "Email": email,
      "Phone":phoneNumber,
      "Password":password,
      "Address":address,
      "PostOfficeBox":postOfficeBox,

    };
  }
}

