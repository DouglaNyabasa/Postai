import 'package:flutter/cupertino.dart';

import '../constants/app_color.dart';


class LogInHeader extends StatelessWidget {
  const LogInHeader({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 120,
          image: AssetImage("lib/assets/images/logo1@2x.png"),
        ),
        const SizedBox(height: 20,),
        Text("Hello ,Welcome back",
          style:
          TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),),
        const SizedBox(height: 10,),
      ],
    );
  }
}