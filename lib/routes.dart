
import 'package:e_commerce_app_demo/home_navigation_bar.dart';
import 'package:e_commerce_app_demo/screens/cart/cart_screen.dart';
import 'package:e_commerce_app_demo/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce_app_demo/screens/forgot_password/forgot_pass_screen.dart';
import 'package:e_commerce_app_demo/screens/home/home_screen.dart';
import 'package:e_commerce_app_demo/screens/login_success/login_success.dart';
import 'package:e_commerce_app_demo/screens/otp/otp_screen.dart';
import 'package:e_commerce_app_demo/screens/product_detail/product_detail_screen.dart';
import 'package:e_commerce_app_demo/screens/profile/profile_screen.dart';
import 'package:e_commerce_app_demo/screens/signin/signin_screen.dart';
import 'package:e_commerce_app_demo/screens/signup/sign_up_screen.dart';
import 'package:e_commerce_app_demo/screens/splash/splash_screen.dart';
import 'package:e_commerce_app_demo/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName : (context) => SplashScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
  ForgotPasswordScreen.routeName : (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName : (context) => LoginSuccessScreen(),
  SignUpScreen.routeName : (context) => SignUpScreen(),
  CompleteProfileScreen.routeName : (context) => CompleteProfileScreen(),
  OPTScreen.routeName : (context) => OPTScreen(),
  HomeScreen.routeName : (context) => HomeScreen(),
  ProductDetailScreen.routeName : (context) => ProductDetailScreen(),
  CartScreen.routeName : (context) => CartScreen(),
  ProfileScreen.routeName : (context) => ProfileScreen(),
  HomeNavigationBar.routeName : (context) => HomeNavigationBar(),
  WishlistScreen.routeName : (context) => WishlistScreen(),
};