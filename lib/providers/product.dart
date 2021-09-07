import 'package:arf_21/models/store_procut.dart';
import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier{
final String id;
final String title;
final String description;
final double price;
final int stock;
final List<String> imageUrl;
List<AttributeValue> attributeValues;
bool isFavorite;

Product(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.stock,
        required this.imageUrl,
         this.attributeValues = const [],
         this.isFavorite = false});




void addOrRemoveFavorite(){
  isFavorite = !isFavorite;
  notifyListeners();
}
}


/*
class AttributeList {

  final int id;
  final String value;
  final dynamic stock;

  AttributeList(this.id, this.value, this.stock);
}*/