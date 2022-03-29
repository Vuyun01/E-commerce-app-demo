import 'package:e_commerce_app_demo/components/heading.dart';
import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/screens/otp/components/otp_form_state.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);
  int toInt(Object value){
    int new_value = int.parse(value.toString());
    return new_value;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.width * 0.1,),
              Heading(
                headingText: "OTP Validation",
                subHeadingText: "We sent your code to your phone number",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expire in ", style: TextStyle(fontSize: size.width * 0.04)),
                  TweenAnimationBuilder(
                    tween: IntTween(begin: 30, end: 0),
                    duration: Duration(seconds: 30), 
                    builder: ( _ ,value, __ ){
                      return Text(
                        "0:${value}",
                        style: TextStyle(color: kPrimaryColor, fontSize: size.width * 0.04),
                      );
                    },
                    onEnd: (){},
                  )
                ],
              ),
              SizedBox(height: size.width * 0.2,),
              OtpFormState(),
              SizedBox(height: size.width * 0.1,),
              TextButton(
                onPressed: (){}, 
                child: Text(
                  "Resend OTP code",
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.7), 
                    fontSize: size.width * 0.04
                  )
                )
              )
            ],
          ),
        ),
      )
    );
  }
}