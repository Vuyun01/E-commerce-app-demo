import 'dart:ui';

import 'package:e_commerce_app_demo/components/signin_or_signout.dart';
import 'package:e_commerce_app_demo/screens/forgot_password/components/forgot_pass_form.dart';
import 'package:e_commerce_app_demo/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SizedBox(height: size.width * 0.1,),          
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor.withOpacity(0.5)
                ),
              ),
              SizedBox(height: size.width * 0.03,),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              ForgotPasswordForm(),
              SizedBox(height: size.width * 0.1,),          
              SignUpOrSignIn(
                onPress: () {
                  Navigator.of(context).popAndPushNamed(SignUpScreen.routeName);
                },
                isAccountExisted: false,
              )
            ],
          )
        ),
      ),
    );
  }
}