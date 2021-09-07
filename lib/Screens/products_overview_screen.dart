import 'package:arf_21/Screens/cart_screen.dart';
import 'package:arf_21/Widgets/app_drawer.dart';
import 'package:arf_21/Widgets/badge.dart';
import 'package:arf_21/providers/cart.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../Widgets/products_grid.dart';
import 'package:flutter/material.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/ProductsOverviewScreen';
  String selectedCategoryName;

  ProductsOverviewScreen(this.selectedCategoryName);

  @override
  _ProductsOverviewScreenState createState() =>
      _ProductsOverviewScreenState(selectedCategoryName);
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var isFavorite = false;
  String selectedCategoryName;

  _ProductsOverviewScreenState(this.selectedCategoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ARF-21 Shop"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == FilterOptions.Favorites) {
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text("Hepsini göster"), value: FilterOptions.All),
              PopupMenuItem(
                child: Text("Favorilerimi göster"),
                value: FilterOptions.Favorites,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, value, child) =>
                Badge(child: cartButton(), value: value.itemCount.toString()),
          )
        ],
      ),
      body: ProductsGrid(isFavorite, selectedCategoryName),
    );
  }

  IconButton cartButton() {
    return IconButton(
        onPressed: () {
          pushNewScreen(
            context,
            screen: CartScreen(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        icon: Icon(Icons.shopping_cart));
  }
}
