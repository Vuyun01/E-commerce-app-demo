
import 'package:e_commerce_app_demo/models/cart.dart';
import 'package:e_commerce_app_demo/screens/cart/components/cart_item_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: ListView.builder(
        itemCount: demoItemsCart.length,
        itemBuilder: (_,index) => Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
          child: Dismissible(
            key: ValueKey(demoItemsCart[index].product.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction){
              setState(() {
                demoItemsCart.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg")
                ],
              ),
            ),
            child: ItemCartProduct(cartItem: demoItemsCart[index],)
          ),
        ),
      ),
    );
  }
}


