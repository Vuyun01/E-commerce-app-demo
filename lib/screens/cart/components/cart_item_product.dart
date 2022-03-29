import 'package:e_commerce_app_demo/components/custom_button.dart';
import 'package:e_commerce_app_demo/models/cart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemCartProduct extends StatefulWidget {
  const ItemCartProduct({
    Key? key,
    required this.cartItem
  }) : super(key: key);

  final Cart cartItem;

  @override
  State<ItemCartProduct> createState() => _ItemCartProductState();
}

class _ItemCartProductState extends State<ItemCartProduct> {

  void decrement() {
    setState(() {
      if(widget.cartItem.numberOfitems == 1){
        widget.cartItem.numberOfitems = 1;
      }else{
        widget.cartItem.numberOfitems--;
      }
    });
  }
  void increment() {
    setState(() {
      widget.cartItem.numberOfitems++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0,-1),
            spreadRadius: 1,
            blurRadius: 3
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.248,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Image.asset(widget.cartItem.product.images[0]),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.cartItem.product.title}", 
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              Text.rich(
                TextSpan(
                  text: "\$${widget.cartItem.product.price}",
                  style: TextStyle(color: kPrimaryColor.withOpacity(0.6), fontSize: 18),
                  children: [
                    TextSpan(
                      text: "  x${widget.cartItem.numberOfitems}",
                      style: TextStyle(color: kTextColor, fontSize: 15)
                    ),
                  ]
                )
              ),
              SizedBox(height: size.width * 0.02,),
              ChangeQuantityButton(
                inProduct: widget.cartItem, 
                increment: increment, 
                decrement: decrement
              )
              
            ],
          )
          
        ],
      ),
    );
  }
}

class ChangeQuantityButton extends StatelessWidget {
  const ChangeQuantityButton({
    Key? key,
    required this.inProduct, 
    required this.increment, 
    required this.decrement,
  }) : super(key: key);

  final Cart inProduct;
  final Function() increment;
  final Function() decrement;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            radius: 10,
            padding: size.width * 0.01,
            width: size.width * 0.07,
            height: size.width * 0.07,
            hasShadow: true, 
            onPress: decrement,
            icon: Icons.remove,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.015),
            width: size.width * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade100,
            ),
            child: Text(
              "${inProduct.numberOfitems}", 
              style: TextStyle(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold 
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CustomIconButton(
            radius: 10,
            padding: size.width * 0.01,
            width: size.width * 0.07,
            height: size.width * 0.07,
            hasShadow: true, 
            onPress: increment,
            icon: Icons.add,
          ),
        
        ]
      ),
    );
  }
}

