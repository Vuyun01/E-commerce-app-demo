import 'package:e_commerce_app_demo/screens/signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}