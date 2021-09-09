

import 'package:arf_21/providers/product.dart';
import 'package:arf_21/utilities/alert_messages.dart';

import '../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/product_item_widget.dart';
import 'package:flutter/material.dart';


class ProductsGrid extends StatelessWidget {
  final bool isFav;
  String selectedCategoryName;

  ProductsGrid(this.isFav,this.selectedCategoryName);

  @override
  Widget build(BuildContext context) {

  //  final productsData = isFav?Provider.of<ProductProvider>(context).favoriteItems: Provider.of<ProductProvider>(context).items;
    final productsData = Provider.of<ProductProvider>(context).itemsByCategory(selectedCategoryName);

    return FutureBuilder(
      future: productsData,
      builder: (context, AsyncSnapshot< List<Product>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return AlertMessagesState.myCircularProgressIndicator();
          default:
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (ctx, i) =>
                      ChangeNotifierProvider.value(
                        value: snapshot.data![i],
                        child: ProductItemWidget( ),
                      ))
              ;
        }
      },
    );
  }
}
