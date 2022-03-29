import 'package:e_commerce_app_demo/components/heading.dart';
import 'package:e_commerce_app_demo/components/signin_or_signout.dart';
import 'package:e_commerce_app_demo/components/social_button.dart';
import 'package:e_commerce_app_demo/screens/complete_profile/components/complete_profile_form.dart';
import 'package:e_commerce_app_demo/screens/signup/components/sign_up_form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          // height: size.height,
          child: Column(
            children: [
              SizedBox(height: size.width * 0.1,),
              Heading(
                headingText: 'Complete Profile', 
                subHeadingText: 'Complete your details or continue \nwith social media', 
              ),
              SizedBox(height: size.width * 0.05),
              CompleteProfileForm(),
              SizedBox(height: size.width * 0.1,),
              Text(
                'By continue your confirm that you agree \nwith Term and Condition',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.width * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}