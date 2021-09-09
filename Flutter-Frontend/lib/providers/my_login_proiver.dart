

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyLoginProvider with ChangeNotifier {



  Future<bool> getLogin() async  {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     bool result = (prefs.getBool('login')) ?? false;
     return result;

  }

  void setLogin() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
    print(prefs.get('login').toString() + " inserted");
    notifyListeners();
  }

  void removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('login');
    notifyListeners();
  }

  bool _clicked = false;

   bool get clicked => _clicked;

  set clicked(bool value) {
    _clicked = value;
    notifyListeners();
  }
}
