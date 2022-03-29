import 'package:e_commerce_app_demo/components/custom_button.dart';
import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:flutter/material.dart';

class DescriptionFooter extends StatefulWidget {
  const DescriptionFooter({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<DescriptionFooter> createState() => _DescriptionFooterState();
}

class _DescriptionFooterState extends State<DescriptionFooter> {
  int indexID = -1;
  int numberItems = 0;

  void _incrementNumber(){
    setState(() {
      numberItems++;
    });
  }

  void _decrementNumber(){
    setState(() {
      if(numberItems == 0){
        numberItems = 0;
      }else{
        numberItems--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColorPickerList(product:  widget.product),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "\$${widget.product.price}",
                style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.6),
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ],
        ),
        SizedBox(height: size.width * 0.1),
        SizedBox(
          width: size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                sizeIcon: size.width * 0.06,
                width: size.width * 0.12,
                height: size.width * 0.12,
                hasShadow: true, 
                onPress: _decrementNumber, 
                icon: Icons.remove,
              ),
              Container(
                width: size.width * 0.1,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade100,
                ),
                child: Text(
                  "$numberItems", 
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomIconButton(
                sizeIcon: size.width * 0.06,
                width: size.width * 0.12,
                height: size.width * 0.12,
                hasShadow: true, 
                onPress: _incrementNumber, 
                icon: Icons.add,
              ),
             
            ]
          ),
        )
      ],
    );
  }

  AnimatedContainer buildIncreAndDecreButton(BuildContext context, int index, IconData icon){
    final size = MediaQuery.of(context).size;
      return AnimatedContainer(
      // width: size.width * 0.1,
      // curve: Curves.easeInOut,
      duration: kAnimationTime,
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: indexID == index ? kTextColor : kTextColor.withOpacity(0.4),
            offset: Offset(1,0),
            spreadRadius: 1,
            blurRadius: 4
          )
        ]
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            indexID = index;
            if(indexID == 0){
              if(numberItems == 0){
                numberItems = 0;
              }else{
                numberItems--;
              }
            }else{
              numberItems++;
            }
          });
        },
        child: Icon(icon)
      ),
    );
  }
}

class ColorPickerList extends StatefulWidget {
  const ColorPickerList({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

  @override
  State<ColorPickerList> createState() => _ColorPickerListState();
}

class _ColorPickerListState extends State<ColorPickerList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: List.generate(widget.product.colors.length,(index) => 
        buildColorDot(context, widget.product, index)
      ),
    );
  }

  AnimatedContainer buildColorDot(BuildContext context, Product product, int index){
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: kAnimationTime,
      margin: EdgeInsets.only(right: size.width * 0.02),
      padding: selectedIndex == index 
          ? EdgeInsets.all(size.width * 0.015)
          : EdgeInsets.all(size.width * 0.005),
      width: size.width * 0.12,
      height: size.width * 0.12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selectedIndex == index 
          ? Border.all(color: kPrimaryColor.withOpacity(0.4), width: 2)
          : null
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedIndex = index;
          });
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.product.colors[index]
          ),
        ),
      ),
    );
  }

}

