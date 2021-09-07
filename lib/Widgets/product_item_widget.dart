import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../providers/cart.dart';

import '../Screens/product_detail_screen.dart';
import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          pushNewScreen(
            context,
            screen: ProductDetailScreen(
              openedProduct: product,
            ),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl.first,
            fit: BoxFit.cover,
          ),
          footer: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTileBar(
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              backgroundColor: Color(0xff003458).withOpacity(0.8),

            ),
          ),
        ),
      ),
    );
  }
}
