import 'package:e_commerce_app_demo/components/custom_button.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:e_commerce_app_demo/screens/product_detail/components/body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({ Key? key }) : super(key: key);
  static String routeName = '/product_detail';
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: size.width * 0.2,
        leading: TextButton(
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
        
      ),
      body: Body(product: product),
    );
  }
}
