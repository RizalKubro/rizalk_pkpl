import 'package:FLUTTERPROJECT/app/modules/home/views/cart_items.dart';
import 'package:get/get.dart';



class CartController extends GetxController {
  var isCart = false.obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(CartItem itemToAdd) {
    cartItems.add(itemToAdd);
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  double get totalCartPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }
}


  