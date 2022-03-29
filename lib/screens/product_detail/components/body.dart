
import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:e_commerce_app_demo/screens/cart/cart_screen.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/background_product_des.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/description_body.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/description_footer.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/description_header.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/product_images.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class Body extends StatelessWidget {
  const Body({ 
    Key? key, 
    required this.product 
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            ProductImages(product: product),
            BackgroundDescriptionProduct(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionHeader(product: product),
                  SizedBox(height: size.width * 0.07),
                  DescriptionBody(product: product),
                  SizedBox(height: size.width * 0.1,),
                  DescriptionFooter(product: product),
                  SizedBox(height: size.width * 0.15),
                  Align(
                    alignment: Alignment.center,
                    child: RoundedButton(
                      width: size.width * 0.7,
                      height: size.width * 0.17,
                      text: "Add to Cart", 
                      onPress: (){
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      }
                    ),
                  ),
                  SizedBox(height: size.width * 0.02),
                ],
              ),
            ),
            // BackgroundDescriptionProduct(
            //   color: Colors.tealAccent.shade100,
            //   child: Container(
            //     height: size.width * 0.2,
            //   )
            // )
          ]
        ),
      ),
    );
  }
}





  

