import 'package:flutter/material.dart';

import '../constants.dart';

class SectionOption extends StatelessWidget {
  const SectionOption({
    Key? key, 
    required this.heading, 
    required this.textButton, 
    required this.onPress,
  }) : super(key: key);

  final String heading;
  final String textButton;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            heading, 
            style: TextStyle(fontSize: size.width * 0.045, fontWeight: FontWeight.bold), 
          ),
          GestureDetector(
            onTap: onPress,
            child: Text(
              textButton,
              style: TextStyle(color: kPrimaryColor.withOpacity(0.8)),
            ),
          )
        ]
      )
    );
  }
}
