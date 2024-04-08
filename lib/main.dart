import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:postai/pages/Auth/login_page.dart';
import 'package:postai/pages/calculate.dart';
import 'package:postai/pages/dashboard.dart';
import 'package:postai/pages/mail_services.dart';
import 'package:postai/pages/shippingcost.dart';
import 'package:postai/services/helper/helper_function.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState(){
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async{
    await HelperFunctions.getUserLoggedInStatus().then((value) => {
      if(value != null){
        setState((){
          _isSignedIn = value;
        })

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark( useMaterial3: true,),
        title: 'Postai',
        home:
        // Dashboard (),
        _isSignedIn ?  Dashboard () : LoginPage(),

    );

  }
}

