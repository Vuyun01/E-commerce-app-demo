import 'package:e_commerce_app_demo/components/icon_button_on_bar.dart';
import 'package:e_commerce_app_demo/components/search_field.dart';
import 'package:e_commerce_app_demo/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SearchField(),
        IconButtonOnBar(
          iconPath: 'assets/icons/Cart Icon.svg', 
          onPress: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
        ),
        IconButtonOnBar(
          numberItems: 5,
          iconPath: 'assets/icons/Bell.svg', 
          onPress: () {  },
        ),
        // Text("BBB")

      ],
    );
  }
}