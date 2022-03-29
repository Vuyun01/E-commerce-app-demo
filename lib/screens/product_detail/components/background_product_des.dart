import 'package:flutter/material.dart';

class BackgroundDescriptionProduct extends StatelessWidget {
  const BackgroundDescriptionProduct({
    Key? key, 
    required this.child, 
    this.color = Colors.white,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.width * 0.04,
      ),
      margin: EdgeInsets.only(top: size.width * 0.05),
      width: size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, -1), // changes position of shadow
          ),
        ]
      ),
      child: child
    );
  }
}
