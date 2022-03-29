import 'package:e_commerce_app_demo/models/product.dart';

class Cart{
  final Product product;
  int numberOfitems;

  Cart({required this.product, required this.numberOfitems});
}

List<Cart> demoItemsCart = [
  Cart(product: demoProducts[0], numberOfitems: 3),
  Cart(product: demoProducts[1], numberOfitems: 1),
  // Cart(product: demoProducts[2], numberOfitems: 1),
  // Cart(product: demoProducts[3], numberOfitems: 2),
  // Cart(product: demoProducts[4], numberOfitems: 3),
  // Cart(product: demoProducts[5], numberOfitems: 1),
  Cart(product: demoProducts[6], numberOfitems: 1),

];