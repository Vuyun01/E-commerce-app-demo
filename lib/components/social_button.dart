import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key, 
    required this.iconPath, 
    required this.onPress,
  }) : super(key: key);

  final String iconPath;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size.width * 0.1,
        height: size.width * 0.1,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.025),
        padding: EdgeInsets.all(size.width * 0.025),
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor.withOpacity(0.6)),
          color: kPrimaryLightColor,
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}