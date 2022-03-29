import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/screens/signin/signin_screen.dart';
import 'package:e_commerce_app_demo/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String,String>> data = [
    {
      "text" : "Welcome to Tokoyo. Let's shop.",
      "image" : "assets/images/splash_1.png"
    },
    {
      "text" : "We help people connect with stores \naround Viet Nam.",
      "image" : "assets/images/splash_2.png"
    },
    {
      "text" : "We show the easy way to shop. \nJust stay at home with us",
      "image" : "assets/images/splash_3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: data.length,
                itemBuilder: ( _ , index ) => SplashContent(data: data[index],)
              )
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(data.length, (index) => buildDot(index)),
                  ),
                  Spacer(flex: 3,),
                  RoundedButton(
                    width: size.width * 0.8,
                    height: size.width * 0.17,
                    text: 'Continue', 
                    onPress: (){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  Spacer(flex: 2,)
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationTime,
      margin: EdgeInsets.symmetric(horizontal: 1.5),
      width: currentPage == index ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPage == index ? kPrimaryColor : kSecondaryColor
      ),
    );
  }
}


