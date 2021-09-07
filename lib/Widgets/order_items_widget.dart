import 'dart:math';
import 'package:arf_21/providers/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItemsWidget extends StatefulWidget {
  final OrderItem orderedItems;
  bool isExpanded = false;

  OrderItemsWidget(this.orderedItems);

  @override
  _OrderItemsWidgetState createState() => _OrderItemsWidgetState();
}

class _OrderItemsWidgetState extends State<OrderItemsWidget> {




  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            widget.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
              isExpanded: widget.isExpanded,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Sipariş No:"),
                      Text(
                        widget.orderedItems.orderId,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Toplam :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text("${widget.orderedItems.orderPrice} TL",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                      .format(widget.orderedItems.orderTime),style: TextStyle(color: Colors.indigo.shade900.withOpacity(0.7),fontWeight: FontWeight.bold,fontSize: 14),),
                );
              },
              body: Container(
                width: double.infinity,
                height:
                    min(widget.orderedItems.orderList.length * 20.0 + 110, 180),
                child: ListView.builder(
                  itemCount: widget.orderedItems.orderList.length,
                  itemBuilder: (context, index) {
                    final data = widget.orderedItems.orderList[index];
                    return ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            data.imageUrl,
                            fit: BoxFit.cover,
                          )),
                     subtitle: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         data.attribute.isNotEmpty?
                         data.attribute =="null"?Container():Chip(label: Text(data.attribute)):
                         Container(),
                         Chip(label: Text(data.price.toString()+" TL")),
                       ],
                     ),
                      title: Text(data.title),
                      trailing: Text("x${data.quantity}"),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

}
