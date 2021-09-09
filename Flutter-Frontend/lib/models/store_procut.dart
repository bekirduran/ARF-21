// To parse this JSON data, do
//
//     final storeProduct = storeProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StoreProduct> storeProductFromJson(String str) => List<StoreProduct>.from(json.decode(str).map((x) => StoreProduct.fromJson(x)));

String storeProductToJson(List<StoreProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreProduct {
  StoreProduct({
   required this.id,
   required this.categoryName,
   required this.categoryDesc,
   required this.image,
   required this.categoryProducts,
  });

  final int id;
  final String categoryName;
  final String categoryDesc;
  final String image;
  final List<CategoryProduct> categoryProducts;

  factory StoreProduct.fromJson(Map<String, dynamic> json) => StoreProduct(
    id: json["id"],
    categoryName: json["categoryName"],
    categoryDesc: json["categoryDesc"],
    image: json["image"],
    categoryProducts: List<CategoryProduct>.from(json["categoryProducts"].map<CategoryProduct>((x) => CategoryProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "categoryDesc": categoryDesc,
    "image": image,
    "categoryProducts": List<dynamic>.from(categoryProducts.map((x) => x.toJson())),
  };
}

class CategoryProduct {
  CategoryProduct({
  required this.id,
  required this.productName,
  required this.productDesc,
  required this.productPrice,
  required this.productStock,
  required this.images,
  required this.attributeValues,
  });

  final int id;
  final String productName;
  final String productDesc;
  final double productPrice;
  final int productStock;
  final List<Image> images;
  final List<AttributeValue> attributeValues;

  factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
    id: json["id"],
    productName: json["productName"],
    productDesc: json["productDesc"],
    productPrice: json["productPrice"],
    productStock: json["productStock"],
    images: List<Image>.from(json["images"].map<Image>((x) => Image.fromJson(x))),
    attributeValues: List<AttributeValue>.from(json["attributeValues"].map<AttributeValue>((x) => AttributeValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "productDesc": productDesc,
    "productPrice": productPrice,
    "productStock": productStock,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "attributeValues": List<dynamic>.from(attributeValues.map((x) => x.toJson())),
  };
}

class AttributeValue {
  AttributeValue({
   required this.id,
   required this.value,
   required this.stock,
  });

  final int id;
  final String value;
  final dynamic stock;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
    id: json["id"],
    value: json["value"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "stock": stock,
  };
}

class Image {
  Image({
   required this.id,
   required this.imageURL,
  });

  final int id;
  final String imageURL;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    imageURL: json["imageURL"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageURL": imageURL,
  };
}
