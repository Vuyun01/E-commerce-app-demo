import 'package:flutter/material.dart';

class DemoBackGroundImage extends StatelessWidget {
  const DemoBackGroundImage({
    Key? key,
    required this.image,
    required this.child
  }) : super(key: key);

  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}