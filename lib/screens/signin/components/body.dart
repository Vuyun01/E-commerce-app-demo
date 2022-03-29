
import 'package:e_commerce_app_demo/components/heading.dart';
import 'package:e_commerce_app_demo/components/signin_or_signout.dart';
import 'package:e_commerce_app_demo/components/social_button.dart';
import 'package:e_commerce_app_demo/screens/signin/components/sign_in_form.dart';
import 'package:e_commerce_app_demo/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,      //double.infinity in sizedbox will set elements to center
          height: size.height,
          child: Column(
            children: [
              SizedBox(height: size.width * 0.1,),          
              Heading(
                headingText: 'Welcome Back',
                subHeadingText: 'Sign in with your email and password \nor continue with social media',
              ),         
              SizedBox(height: size.width * 0.1,),
              SignInForm(),
              SizedBox(height: size.width * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(iconPath: 'assets/icons/twitter.svg', onPress: () { },),
                  SocialButton(iconPath: 'assets/icons/google-icon.svg', onPress: () { },),
                  SocialButton(iconPath: 'assets/icons/facebook-2.svg', onPress: () { },),
                ],
              ),
              SignUpOrSignIn(
                isAccountExisted: false, 
                onPress: () => Navigator.of(context).pushNamed(SignUpScreen.routeName),
             ),
            ],
          ),
        ),
      ),
    );
  }
}









