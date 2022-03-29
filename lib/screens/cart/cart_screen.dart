import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/models/cart.dart';
import 'package:e_commerce_app_demo/screens/cart/components/body.dart';
import 'package:e_commerce_app_demo/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
              Text(
                "Your Cart",
                style: TextStyle(fontSize: size.width * 0.06, fontWeight: FontWeight.bold),
              ),
              Text("${demoItemsCart.length} items"),
            ],
          ),
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
      body: Body(),
      bottomNavigationBar: CartBottomBar(),
    );
  }
}

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          // topRight: Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.02),
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  SizedBox(width: size.width * 0.02,),
                  InkWell(
                    onTap: (){},
                    child: Text(
                      "Add voucher code",
                      style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),
                    )
                  )
                ],
              ),
              RoundedButton(
                text: "Check out", onPress: (){},
                height: size.width * 0.18,
                width: size.width * 0.6
              )
            ],  
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total: ", 
                style: TextStyle(
                  fontSize: size.width * 0.05, 
                  color: kPrimaryColor.withOpacity(0.6)),
              ),
              Text(
                "\$439.89",
                style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)
              )
            ],
          )
        ],
      )
    );
  }
}