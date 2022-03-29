import 'package:e_commerce_app_demo/components/custom_button.dart';
import 'package:e_commerce_app_demo/models/cart.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class WishlistCardProduct extends StatelessWidget {
  const WishlistCardProduct({
    Key? key,
    required this.item, 
    required this.onPress
  }) : super(key: key);

  final Product item;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.bodyText1,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.shade300, width: 2)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.25,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Image.asset(item.images[0]),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${item.title}", 
                style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                maxLines: 2,
              ),
              Text.rich(
                TextSpan(
                  text: "\$${item.price}",
                  style: TextStyle(color: kPrimaryColor.withOpacity(0.6), fontSize: 18),
                  children: [
                    TextSpan(
                      text: "  x1",
                      style: TextStyle(color: kTextColor, fontSize: 15)
                    ),
                  ]
                )
              ),
              SizedBox(height: size.width * 0.02,),
              
            ],
          )
        ],
      ),
    );
  }
}

