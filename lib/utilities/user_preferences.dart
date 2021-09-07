import 'package:arf_21/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{




  void saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.id);
    prefs.setString("username", user.username);
    prefs.setString("name", user.name);
    prefs.setString("lastname", user.lastname.isEmpty? "": user.lastname);
    prefs.setString("email", user.email);
    prefs.setString("tc", user.tc.isEmpty? "": user.tc);
    prefs.setString("image", user.image.isEmpty? "": user.image);
    prefs.setString("adres", user.adres.isEmpty? "": user.adres);
    prefs.setString("accessToken", user.accessToken);
    prefs.setString("tokenType", user.tokenType );
    prefs.setBool("login", true);

  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    int userId = prefs.getInt("userId")??0;
    String username = prefs.getString("username")??"";
    String name = prefs.getString("name") ?? "";
    String lastname = prefs.getString("lastname") ?? "";
    String email = prefs.getString("email")??"";
    String tc = prefs.getString("tc") ?? "";
    String image = prefs.getString("image") ?? "";
    String adres = prefs.getString("adres") ?? "";
    String accessToken = prefs.getString("accessToken") ?? "";
    String tokenType = prefs.getString("tokenType") ?? "";

    return User(
        id: userId,
        username: username,
        email: email,
        name: name,
        lastname: lastname,
        tc: tc,
        image: image,
        adres: adres,
        accessToken: accessToken,
        tokenType: tokenType);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("username");
    prefs.remove("email");
    prefs.remove("name");
    prefs.remove("lastname");
    prefs.remove("tc");
    prefs.remove("image");
    prefs.remove("adres");
    prefs.remove("accessToken");
    prefs.remove("tokenType");
  }

}
