import 'package:e_commerce_app_demo/screens/otp/components/body.dart';
import 'package:flutter/material.dart';


class OPTScreen extends StatelessWidget {
  const OPTScreen({ Key? key }) : super(key: key);
  static String routeName = '/otp_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
  
}