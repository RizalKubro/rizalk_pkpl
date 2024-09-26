class CartItemModel {
  String name;
  double price;
  int quantity;
  int totalPrice;
  DateTime timestamp;
  String id;

  CartItemModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.timestamp,
    required this.id,
  });

  CartItemModel.fromJson(Map<String, dynamic> json, String tempId)
      : name = json['name'],
        price = json['price'].toDouble(),
        quantity = json['quantity'],
        totalPrice = json['totalPrice'],
        timestamp = DateTime.parse(json['timestamp']),
        id = tempId;

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'timestamp': timestamp.toIso8601String(),
      };
}
