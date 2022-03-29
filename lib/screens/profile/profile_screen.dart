import 'package:e_commerce_app_demo/screens/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: TextStyle(fontSize: size.width * 0.06, fontWeight: FontWeight.bold)),
        leadingWidth: size.width * 0.2,
        leading: TextButton(
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
      ),
      body: Body(),
    );
  }
}