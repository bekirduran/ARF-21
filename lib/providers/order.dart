import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/cart.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final int userId;
  final String orderId;
  final List<CartItem> orderList;
  final DateTime orderTime;
  final double orderPrice;

  OrderItem(
      {required this.userId,
      required this.orderId,
      required this.orderList,
      required this.orderTime,
      required this.orderPrice});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    userId: json["orderId"],
    orderId: json["orderId"].toString(),
    orderTime: DateTime.parse(json["orderTime"]),
    orderPrice: json["orderPrice"],
    orderList: List<CartItem>.from(json["orderItems"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userid": this.userId,
    "orderDate": "${this.orderTime.year.toString().padLeft(4, '0')}-${this.orderTime.month.toString().padLeft(2, '0')}-${this.orderTime.day.toString().padLeft(2, '0')}",
    "orderTotal": this.orderPrice,
    "orderItems": List<dynamic>.from(this.orderList.map((x) => x.toJson())),
  };

}





class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }


  void addNewOrderToDb(OrderItem orderedItems) {
    var jsonData = orderedItems.toJson();
    print(jsonData.toString());
    var res =  DataHelper.postJsonList(Constants.createOrder, jsonData);
    res.then((value) => print(value.body.toString()));
  }


  Future<void> addOrder(List<CartItem> carProducts, double total) async {
    UserPreferences().getUser().then((value) {
        var newOrder = OrderItem(userId: value.id, orderId: 0.toString(),
            orderList: carProducts, orderTime: DateTime.now(), orderPrice: total);
        addNewOrderToDb(newOrder);

    });
    notifyListeners();
  }



}
