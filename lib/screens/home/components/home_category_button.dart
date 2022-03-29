import 'package:e_commerce_app_demo/components/category_button.dart';
import 'package:flutter/material.dart';

class HomeCategoryButton extends StatelessWidget {
  const HomeCategoryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryButton(iconPath: 'assets/icons/Flash Icon.svg', onPress: () {  }, text: 'Flash\nSale',),
        CategoryButton(iconPath: 'assets/icons/Bill Icon.svg', onPress: () {  }, text: 'Bill',),
        CategoryButton(iconPath: 'assets/icons/Game Icon.svg', onPress: () {  }, text: 'Game',),
        CategoryButton(iconPath: 'assets/icons/Gift Icon.svg', onPress: () {  }, text: 'Gift',),
        CategoryButton(iconPath: 'assets/icons/Discover.svg', onPress: () {  }, text: 'More',),
      ],
    );
  }
}