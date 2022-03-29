import 'package:e_commerce_app_demo/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({ Key? key }) : super(key: key);
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
       body: Body(),
    );
  }
}