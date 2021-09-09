import 'package:flutter/material.dart';

class CartItem {
  final String timeAdded;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String attribute;
  final String imageUrl;

  CartItem({required this.timeAdded,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
    required this.attribute,
    required this.imageUrl});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    timeAdded: json["productId"].toString(),
    productId: json["productId"].toString(),
    title: json["title"],
    quantity: json["quantity"],
    price: json["price"],
    attribute: json["attribute"] == null ? "null" : json["attribute"],
    imageUrl: json["imageUrl"],
  );


  Map<String, dynamic> toJson() => {
    "productId": this.productId,
    "quantity": this.quantity,
    "attribute":this.attribute
  };
}

class Cart with ChangeNotifier {
  Map <String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total= 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }



  void addItem(String productId, String proId, String title, double price,int quantity ,String attribute,String imageUrl) {
    if (_items.containsKey(productId)) {

      _items.update(productId, (value) =>
          CartItem(timeAdded: value.timeAdded,
              productId: proId,
              title: value.title,
              quantity: value.quantity + quantity,
              price: value.price,
              attribute: value.attribute,
              imageUrl: imageUrl));

    } else {
      _items.putIfAbsent(productId, () =>
          CartItem(timeAdded: DateTime.now().millisecondsSinceEpoch.toString(),
              productId: proId,
              title: title,
              quantity: quantity,
              price: price,
              attribute: attribute,
              imageUrl: imageUrl));

    }
    notifyListeners();
  }

  void removeItemById(String id){
    _items.remove(id);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

}
