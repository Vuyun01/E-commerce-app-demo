
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key, 
    required this.product, 
    required this.onTap
  }) : super(key: key);

  final Product product;
  final Function() onTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // bool favoriteState = false;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.05),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        // splashColor: Colors.white10,
        onTap: widget.onTap,
        child: SizedBox(
          width: size.width * 0.35,
          height: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.width * 0.35,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kSecondaryColor.withOpacity(0.1)
                ),
                child: Image.asset(widget.product.images[0]),
              ),
              SizedBox(height: size.width * 0.02,),
              Text(widget.product.title, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: size.width * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.6),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // favoriteState = !favoriteState;
                        widget.product.isFavourite = !widget.product.isFavourite;
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: size.width * 0.07,
                      height: size.width * 0.07,
                      padding: EdgeInsets.all(size.width * 0.015),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.product.isFavourite 
                        ? kPrimaryColor.withOpacity(0.2) 
                        : kSecondaryColor.withOpacity(0.15),
                      ),
                      child: widget.product.isFavourite 
                      ? SvgPicture.asset(
                          'assets/icons/Heart Icon_2.svg',
                          color: Color(0xFFFF4848),
                        )
                      : SvgPicture.asset(
                          'assets/icons/Heart Icon.svg',
                          color: Color(0xFFFF4848),
                        )
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
