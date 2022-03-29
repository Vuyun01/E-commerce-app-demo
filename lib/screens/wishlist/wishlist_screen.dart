import 'package:e_commerce_app_demo/screens/wishlist/components/body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({ Key? key }) : super(key: key);
  static String routeName = "/wishlist";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: TextStyle(fontSize: size.width * 0.06, fontWeight: FontWeight.bold),
        ),
        leadingWidth: size.width * 0.2,
        leading: Container(),
      ),
      body: Body(),
    );
  }
}