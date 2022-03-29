import 'package:e_commerce_app_demo/constants.dart';
import 'package:e_commerce_app_demo/demo_image_bg.dart';
import 'package:e_commerce_app_demo/screens/home/home_screen.dart';
import 'package:e_commerce_app_demo/screens/profile/profile_screen.dart';
import 'package:e_commerce_app_demo/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animations/animations.dart';
class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({ Key? key }) : super(key: key);
  static String routeName = '/home_page';
  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    WishlistScreen(),
    DemoBackGroundImage(image: "assets/images/yourname.png", child: Container(),),
    ProfileScreen(),
  ];
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // body: pages[currentIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child,  primaryAnimation,  secondaryAnimation) => 
          FadeThroughTransition(
            animation: primaryAnimation, 
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: size.width * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0,-3),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.3)
            )
          ]
        ),
        child: Row(
          children: [
            navigationBarItem(index: 0, iconPath: "assets/icons/Shop Icon.svg"),
            navigationBarItem(index: 1, iconPath: "assets/icons/Heart Icon.svg"),
            navigationBarItem(index: 2, iconPath: "assets/icons/Chat bubble Icon.svg"),
            navigationBarItem(index: 3, iconPath: "assets/icons/User Icon.svg"),
            
          ],
        ),
      )
    );
  }

  Widget navigationBarItem({required int index,  required String iconPath}) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: size.width / pages.length,
        decoration: BoxDecoration(
          border: currentIndex == index 
            ? Border(top: BorderSide(
                color: kPrimaryColor.withOpacity(0.6), 
                width: 4))
            : Border(),
          ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: currentIndex == index ? kPrimaryColor : Colors.grey
          )
        ),
      ),
    );
  }
}

