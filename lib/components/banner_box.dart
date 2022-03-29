import 'package:flutter/material.dart';

import '../constants.dart';

class BannerBox extends StatelessWidget {
  const BannerBox({
    Key? key, 
    required this.text, 
    required this.textHeading,
  }) : super(key: key);

  final String text;
  final String textHeading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.07),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: size.width * 0.9,
      // height: size.width * 0.2,
      decoration: BoxDecoration(
        gradient: kBannerGredientColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "$textHeading\n",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      )
    );
  }
}