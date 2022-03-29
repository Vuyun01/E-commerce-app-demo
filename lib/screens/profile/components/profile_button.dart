import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key, 
    required this.text, 
    required this.iconPath, 
    required this.onPress
  }) : super(key: key);

  final String iconPath;
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.025),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.width * 0.05),
          backgroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: onPress, 
        child: Row(
          children: [
            SvgPicture.asset(iconPath, color: kPrimaryColor,width: size.width * 0.05,),
            SizedBox(width: size.width * 0.05,),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.button,
                
              ),
            ),
            Icon(Icons.arrow_forward_ios,color: kTextColor,)
          ],
        )
      ),
    );
  }
}
