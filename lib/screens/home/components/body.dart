
import 'package:e_commerce_app_demo/components/banner_box.dart';
import 'package:e_commerce_app_demo/components/category_button.dart';
import 'package:e_commerce_app_demo/components/category_product.dart';
import 'package:e_commerce_app_demo/components/product_card.dart';
import 'package:e_commerce_app_demo/components/section_option.dart';
import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/models/product.dart';
import 'package:e_commerce_app_demo/screens/home/components/home_category_button.dart';
import 'package:e_commerce_app_demo/screens/home/components/home_header.dart';
import 'package:e_commerce_app_demo/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool iconSearch = true;
  bool favoriteState = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.width * 0.05,),
              HomeHeader(),
              BannerBox(textHeading: "A Summer Surprise", text: "Cashback 20%",),
              HomeCategoryButton(),
              SizedBox(height: size.width * 0.07,),
              Column(
                children: [
                  SectionOption(
                    heading: 'Special for you', 
                    onPress: () {  }, 
                    textButton: 'See more',
                  ),
                  SizedBox(height: size.width * 0.05),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryProducts(
                          imagePath: "assets/images/Image Banner 2.png", 
                          onPress: (){}, 
                          heading: "Smartphone",
                          numberOfItems: 18,
                        ),
                        CategoryProducts(
                          imagePath: "assets/images/Image Banner 3.png", 
                          onPress: (){}, 
                          heading: "Fashion",
                          numberOfItems: 26,
                        ),
                        SizedBox(width: size.width * 0.04)
                      ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.07),
              Column(
                children: [
                  SectionOption(
                    heading: "Popular product", 
                    textButton: "See more",
                    onPress: (){},
                  ),
                  SizedBox(height: size.width * 0.05,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                        demoProducts.length, (index) => ProductCard(
                            product: demoProducts[index], 
                            onTap: (){
                              Navigator.of(context).pushNamed(
                                ProductDetailScreen.routeName, 
                                arguments: demoProducts[index]
                              );
                            }
                          )
                        ),
                        SizedBox(width: size.width * 0.05,)
                      ]
                      
                    ),
                  )
                ],
              ),
              SizedBox(height: size.width * 0.1)
            ],
          ),
        ),
      ),
    );
  }
}


