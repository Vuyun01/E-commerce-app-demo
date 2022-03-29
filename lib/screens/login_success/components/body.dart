import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/home_navigation_bar.dart';
import 'package:e_commerce_app_demo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            // SizedBox(height: size.width * 0.1),
            Spacer(),
            Image.asset('assets/images/success.png'),
            Spacer(),
            Text(
              "Login Success",
              style: TextStyle(
                fontSize: size.width * 0.1,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor.withOpacity(0.7)
              ),
            ),
            Spacer(flex: 3,),
            RoundedButton(
              width: size.width * 0.8,
              height: size.width * 0.17,
              text: "Back to home", 
              onPress: () => Navigator.popAndPushNamed(context, HomeNavigationBar.routeName)
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}