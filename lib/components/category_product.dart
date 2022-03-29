import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    Key? key,
    required this.imagePath, 
    required this.onPress,
    required this.heading, 
    required this.numberOfItems, 
  }) : super(key: key);

  final String imagePath;
  final String heading;
  final int numberOfItems;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.04),
      child: GestureDetector(
        onTap: onPress,
        child: SizedBox(
          width: size.width * 0.6,
          height: size.width * 0.25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(imagePath, fit: BoxFit.cover,),
                Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.width * 0.02
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),             
                      ]
                    )
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white ),
                      children: [
                        TextSpan(
                          text: "$heading\n",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(text: "$numberOfItems brands")
                      ]
                    )
                  )
                )
              ]   
            )
          ),
        ),
      ),
    );
  }
}