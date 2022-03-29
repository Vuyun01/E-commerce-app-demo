import 'package:flutter/material.dart';

import '../constants.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key, 
    required this.headingText, 
    required this.subHeadingText,
  }) : super(key: key);

  final String headingText;
  final String subHeadingText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          headingText,
          style: TextStyle(
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor.withOpacity(0.5)
          ),
        ),
        SizedBox(height: size.width * 0.03,),
        Text(
          subHeadingText,
          style: TextStyle(
            fontSize: size.width * 0.04,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}