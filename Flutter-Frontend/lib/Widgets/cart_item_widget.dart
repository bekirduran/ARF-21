import 'package:arf_21/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
   final CartItem addedCartItem;

  CartItemWidget(this.addedCartItem);



  @override
  Widget build(BuildContext context) {
final cardProvider = Provider.of<Cart>(context);
print("product id :"+addedCartItem.productId+" id:" +addedCartItem.timeAdded);
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => cardProvider.removeItemById(addedCartItem.productId) ,
      key: ValueKey(addedCartItem.timeAdded),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,size: 40,color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        margin:  EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
   child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: ListTile(
         leading: ClipRRect(
             borderRadius: BorderRadius.circular(5),
             child: Image.network(addedCartItem.imageUrl,fit: BoxFit.cover,)) ,
         title: Text(addedCartItem.title),
         subtitle: Text("${addedCartItem.price} TL"),
         trailing: Text("x ${addedCartItem.quantity}",style: TextStyle(fontSize: 21),),
       ),
   ),
      ),
    );
  }


}
