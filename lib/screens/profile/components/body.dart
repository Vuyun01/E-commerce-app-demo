import 'package:e_commerce_app_demo/screens/profile/components/profile_button.dart';
import 'package:e_commerce_app_demo/screens/profile/components/profile_picture.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> profile_data = [
      {
        "text" : "My Profile",
        "icon" : "assets/icons/User Icon.svg",
      },
      {
        "text" : "Notifications",
        "icon" : "assets/icons/Bell.svg",
      },
      {
        "text" : "Settings",
        "icon" : "assets/icons/Settings.svg",
      },
      {
        "text" : "Help Center",
        "icon" : "assets/icons/Question mark.svg",
      },
      {
        "text" : "Log Out",
        "icon" : "assets/icons/Log out.svg",
      },
    ];
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: size.width * 0.04,),
            ProfilePicture(),
            SizedBox(height: size.width * 0.08,),
            Column(
              children: List.generate(profile_data.length, (index) => ProfileButton(
                  text: "${profile_data[index]['text']}", 
                  iconPath: "${profile_data[index]['icon']}", 
                  onPress: (){}
                )
              )
            )
          ]
        ),
      ),
    );
  }
}


