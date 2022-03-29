import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key, 
    required this.iconPath, 
    required this.onPress, 
    required this.text,
  }) : super(key: key);

  final String iconPath;
  final Function() onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.15,
          height: size.width * 0.15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor.withOpacity(0.2),
                padding: EdgeInsets.all(size.width * 0.02),
              ),
              onPressed: onPress,
              child: SvgPicture.asset(iconPath),
            ),
          ),
        ),
        SizedBox(height: size.width * 0.01),
        SizedBox(
          height: size.width * 0.1,
          child: Text(
            text,
            style: TextStyle(color: kPrimaryColor.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}