import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class DescriptionBody extends StatefulWidget {
  const DescriptionBody({ Key? key , required this.product}) : super(key: key);
  final Product product;

  @override
  State<DescriptionBody> createState() => _DescriptionBodyState();
}

class _DescriptionBodyState extends State<DescriptionBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DescriptionSection(product: widget.product),
        HeartButton(
          onTap: (){
            setState(() {
              widget.product.isFavourite = !widget.product.isFavourite;
            });
          }, 
          product: widget.product, 
        )
      ],
    );
  }
}


class HeartButton extends StatelessWidget {
  const HeartButton({ 
    Key? key, 
    required this.onTap, 
    required this.product,
    
    

  }) : super(key: key);

  final Function() onTap;
  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        width: size.width * 0.15,
        height: size.width * 0.15,
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: product.isFavourite ? kPrimaryLightColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4
            )
          ]
        ),
        child: SvgPicture.asset(
            "assets/icons/Heart Icon_2.svg", 
            color: product.isFavourite ? Color(0xFFFF4848) : Color(0xFF979797)
          )
        ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    Key? key, 
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.description),
          TextButton(
            onPressed: (){}, 
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero
            ),
            child: Text(
              "See More Detail  >", 
              style: TextStyle(
                color: kPrimaryColor.withOpacity(0.6), 
                fontWeight: FontWeight.bold
              )
            ) 
          )
        ],
      ),
    );
  }
}