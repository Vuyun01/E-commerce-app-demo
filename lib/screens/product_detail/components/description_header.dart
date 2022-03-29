import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionHeader extends StatelessWidget {
  const DescriptionHeader({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.title,
          style: Theme.of(context).textTheme.headline6,
          maxLines: 2,
        ),
        RatingSection(product: product)
      ],
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.07,
      width: size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${product.rating}"),
          SvgPicture.asset("assets/icons/Star Icon.svg")
        ],
      ),
    );
  }
}

