import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:e_commerce_app_demo/screens/wishlist/components/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> wishList = [];
  void createWishList(){
    for (var i = 0; i < demoProducts.length; i++){
      if(demoProducts[i].isFavourite == true){
        wishList.add(demoProducts[i]);
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createWishList();
  }
  
  @override
  Widget build(BuildContext context) {
    bool _checkWishlist = wishList.isNotEmpty;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: _checkWishlist ? ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (_,index) => Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
          child: Dismissible(
            key: ValueKey(wishList[index].id),
            onDismissed: (direction){
              setState(() {
                wishList.removeAt(index);
              });
              // if(wishList.isEmpty){
              //   setState(() {
              //     _checkWishlist = !_checkWishlist;
              //   });
              // }
            },
            background: buildSwipeOptionLeft(),
            secondaryBackground: buildSwipeOptionRight(),
             child: WishlistCardProduct(item: wishList[index], onPress: (){},)
            ),
          ),
      )
      : Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            alignment: Alignment.center,
            height: size.width * 0.5,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(blurRadius: 5,)
              ]
            ),
            child: Text(
              "Oops! Your Cart is empty now \nContinue shopping.",
              style: TextStyle(
                letterSpacing: 1.4,
                height: 2,
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
      )
    );
  }

  Container buildSwipeOptionLeft() {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.circular(15)
        ),
      child: SvgPicture.asset("assets/icons/Cart Icon.svg", color: Colors.black,),
    );
  }

  Container buildSwipeOptionRight() {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      decoration: BoxDecoration(
        color: Color(0xFFFFE6E6),
        borderRadius: BorderRadius.circular(15)
        ),
      child: SvgPicture.asset("assets/icons/Trash.svg")
    );
  }
}