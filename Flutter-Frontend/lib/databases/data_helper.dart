import 'dart:convert';
import 'package:arf_21/models/company_model.dart';
import 'package:arf_21/models/store_procut.dart';
import 'package:arf_21/providers/order.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:arf_21/utilities/user_preferences.dart';

import 'package:http/http.dart' as http;



class DataHelper {



  static Future postJsonList(String url,var postData) async{

    try {
      final response = await http.post(
          Uri.parse(url), headers: Constants.myHeader,
          body: json.encode(postData)).timeout(Duration(seconds: 5));
      return response;
    }catch(e){
      return e;
    }
  }

  static Future registerPostJsonList(String url,var postData) async{
    try {
    final  response = await http.post(Uri.parse(url),headers: Constants.myHeader, body: json.encode(postData)).timeout(Duration(seconds: 5));
    return response;
    }catch(e){
      return e;
    }
  }


  static Future<List<StoreProduct>> fetchData(String url)async{
    final myResponse = await http.get(Uri.parse(url),headers: Constants.myHeader);
    List<StoreProduct> storeProduct = [];
    if (myResponse.statusCode == 200) {
     var data = (jsonDecode(utf8.decode(myResponse.bodyBytes)) as List<dynamic>).cast<Map<String,dynamic>>();
     List<StoreProduct> storeProduct = data.map((e) => StoreProduct.fromJson(e)).toList();
      return storeProduct;
    }
    return storeProduct;
  }



  static Future<List<OrderItem>> getMyOrders()async{
    List<OrderItem> orders = [];
    try {
    await UserPreferences().getUser().then((user) async {
        var response = await http.get(Uri.parse(Constants.getOrders+user.id.toString()),headers: Constants.myHeader);
        if (response.statusCode == 200){
          var data = (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>).cast<Map<String,dynamic>>();
          orders = data.map((e) => OrderItem.fromJson(e)).toList();
          return orders;
        }
      });
    }catch(e){
      print("catch'e düştü"+e.toString());
    }
    return orders;
  }





  static Future<List<CategoryProduct>> productByCategory(String cat) async{
    List<CategoryProduct> list = [];

    var data = await  fetchData(Constants.allProductUrl);
    data.forEach((element) {
      if(cat == element.categoryName){
        list.addAll(element.categoryProducts);}
    });
    return list;
  }

// Şirketler Listeis API bağlantısı
  static Future<List<Company>> fetchCompany() async {
    List<Company> list = [];
    final response = await http.get(Uri.parse(Constants.companies),headers: Constants.myHeader);
    if (response.statusCode == 200) {
      var data = (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>).cast<Map<String,dynamic>>();
      List<Company> companies = data.map((e) => Company.fromJson(e)).toList();
      return companies;
    }
    return list;
  }

  List<Company> parseCompany(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Company>((json) => Company.fromJson(json)).toList();
  }



  static Future postApplication(var postData) async{
    try {
        final response = await http.post(
            Uri.parse(Constants.postApplication), headers: Constants.myHeader,
            body: json.encode(postData)).timeout(Duration(seconds: 5));
        return response.statusCode;
    }catch(e){
      return e;
    }
  }


  static Future getMyApplication()async{
    late int userid;
    await UserPreferences().getUser().then((user) async {
      userid = user.id;
    });


    try {
        var response = await http.get(Uri.parse(Constants.getApplications+userid.toString()),headers: Constants.myHeader);
        if (response.statusCode == 200){
          var data = (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>);
          return data;
        }

    }catch(e){
      print("catch'e düştü"+e.toString());
    }
  }



}