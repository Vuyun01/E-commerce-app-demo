import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({ 
    Key? key, 
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: AspectRatio(
            aspectRatio:  1,
            child: Image.asset(widget.product.images[selectedItem]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.product.images.length, (index) => 
            buildProductImageSelector(size,index)
          )
        )
      ],
    );
  
  }
  AnimatedContainer buildProductImageSelector(Size size,int index) {
    return AnimatedContainer(
      duration: kAnimationTime,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      padding: EdgeInsets.all(size.width * 0.01),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedItem == index ? kPrimaryColor.withOpacity(0.4) : Colors.grey.shade200, 
          width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedItem = index;
          });
        },
        child: SizedBox(
          width: size.width * 0.1,
          height: size.width * 0.1,
          child: Image.asset(widget.product.images[index],),
        ),
      ),
    );
  }
}