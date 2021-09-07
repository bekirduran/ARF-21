import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/store_procut.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:http/http.dart';

import 'product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }


  Future<List<StoreProduct>> categoriesOfProduct() async{
    List<StoreProduct> _categoriesOfProduct = [];
    var data = await DataHelper.fetchData(Constants.allProductUrl);
    _categoriesOfProduct.addAll(data);
    return _categoriesOfProduct;
  }


  Future<List<Product>> itemsByCategory(String cat) async {
    List<Product> list = [];

    var data = await DataHelper.productByCategory(cat);
    data.forEach((eachData) {
      if(eachData.attributeValues.isNotEmpty) {
        list.add(
            Product(

                id: eachData.id.toString(),
                title: eachData.productName,
                description: eachData.productDesc,
                price: eachData.productPrice,
                imageUrl: eachData.images.map((e) => e.imageURL).toList(),
                attributeValues: eachData.attributeValues,
                stock: eachData.productStock
            ));
      }else{
        list.add(
            Product(

                id: eachData.id.toString(),
                title: eachData.productName,
                description: eachData.productDesc,
                price: eachData.productPrice,
                imageUrl: eachData.images.map((e) => e.imageURL).toList(),
                stock: eachData.productStock
            ));
      }

    });
    return list;
  }


  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
