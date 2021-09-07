import 'package:arf_21/Screens/orders_screen.dart';
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Widgets/cart_item_widget.dart';
import '../providers/cart.dart';
import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/CartScreen';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("SEPETiNiZ"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Toplam",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        cartProvider.totalAmount.toStringAsFixed(2) + " TL",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.green),
                    onPressed: () {
                       orderProvider.addOrder(cartProvider.items.values.toList(), cartProvider.totalAmount);
                       cartProvider.clear();
                       AlertMessagesState().showDialogBox(context,"Siparişiniz başarıyla kayıt edildi", "Tamam", false);

                       Future.delayed(Duration(seconds: 3)).whenComplete((){
                         pushNewScreen( context, screen: OrdersScreen(),  withNavBar: true,
                           pageTransitionAnimation: PageTransitionAnimation.cupertino, );
                       });


                    },
                    child: Text(
                      "Onayla",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: ListView.builder(
              itemCount: cartProvider.itemCount ,
              itemBuilder: (context, index) => CartItemWidget(cartProvider.items.values.toList()[index]) ,))
        ],
      ),
    );
  }
  void addNewOrder(OrderItem orderedItems) {

    var jsonData = orderedItems.toJson();
    print(jsonData.toString());

    var res =  DataHelper.postJsonList(Constants.createOrder, jsonData);
    res.then((value) => print(value.body.toString()));


  }
}
