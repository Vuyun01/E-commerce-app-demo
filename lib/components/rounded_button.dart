import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key, 
    required this.text, 
    required this.onPress,
    this.bgColor = kPrimaryColor, 
    this.width = 300, 
    this.height = 60, 
  }) : super(key: key);

  final String text;
  final Color bgColor;
  final Function() onPress;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
          onPressed: onPress,
          child: Text(
            text, 
            style: TextStyle(
              color: kPrimaryLightColor,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
    );
  }
}
