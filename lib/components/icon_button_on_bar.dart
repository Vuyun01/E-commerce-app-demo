import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class IconButtonOnBar extends StatelessWidget {
  const IconButtonOnBar({
    Key? key, 
    required this.iconPath, 
    required this.onPress,
    this.numberItems = 0, 

  }) : super(key: key);

  final String iconPath;
  final int numberItems;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(size.width * 0.03),
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
              color: kTextColor.withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(iconPath),
          ),
          Positioned(
            top: -2,
            right: 0,
            child: Container(
              width: size.width * 0.05,
              height: size.width * 0.05,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white)
              ),
              child: Center(
                child: Text(
                  "$numberItems",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    fontSize: size.width * 0.025
                  ),
                ),
              ),
            ),
          )
          
        ] 
      ),
    );
  }
}