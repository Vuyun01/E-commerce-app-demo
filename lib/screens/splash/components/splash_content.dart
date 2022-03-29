import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key, 
    required this.data, 
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Spacer(flex: 2),
        Text(
          'TOKOYO',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07
          ),
        ),
        Text('${data["text"]}', textAlign: TextAlign.center,),
        Spacer(flex: 3),
        Image.asset('${data["image"]}', width: size.width * 0.7,),
      ],
    );
  }
}