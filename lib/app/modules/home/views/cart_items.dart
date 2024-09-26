import 'package:FLUTTERPROJECT/app/models/cartitem_models.dart';

class CartItem extends CartItemModel {
  CartItem({
    required String name,
    required double price,
    required int quantity,
    required String id,
    required int totalPrice,
    required DateTime timestamp,
  }) : super(name: name, price: price, quantity: quantity, id: id, totalPrice: totalPrice, timestamp: timestamp);

  String get title => '';
}
