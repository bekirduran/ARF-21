import 'package:arf_21/Widgets/app_drawer.dart';
import 'package:arf_21/Widgets/order_items_widget.dart';
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/providers/order.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/OrdersScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<OrderItem>>(
          future: DataHelper.getMyOrders(),
          builder: (context, AsyncSnapshot<List<OrderItem>> snapshot) {

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return AlertMessagesState.myCircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Scaffold(
                      appBar: AppBar(
                          title: Text(
                              "Siparişlerim - Toplam: ${snapshot.data!.length}")),
                      drawer: AppDrawer(),
                      body: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) =>
                            OrderItemsWidget(snapshot.data![index]),
                      ));
            }
          }),
    );
  }
}
