import 'package:flutter/material.dart';

import '../constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({ 
    Key? key,
    this.sizeIcon = 15,
    this.hasShadow = false, 
    this.radius = 20, 
    this.width = 40, 
    this.height = 40,
    this.padding = 10,
    this.bgColor = Colors.white,
    required this.onPress,
    required this.icon,

  }) : super(key: key);
  final bool hasShadow;
  final double radius, width, height, sizeIcon, padding;
  final IconData icon;
  final Function() onPress;
  final Color bgColor;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: hasShadow ? BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.4),
            offset: Offset(1,0),
            spreadRadius: 1,
            blurRadius: 4
          )
        ]
      ) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            padding: EdgeInsets.all(padding)

          ),
          onPressed: onPress, 
          child: Icon(icon, color: kTextColor, size: sizeIcon,)
        ),
      ),
    );
  }
}