import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key, required this.pathIcon,
  }) : super(key: key);

  final String pathIcon;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: size.width * 0.06),
      child: SvgPicture.asset(pathIcon,width: size.width * 0.06,)
    );
  }
}