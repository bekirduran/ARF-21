import 'package:arf_21/Screens/home_screeen.dart';
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/user.dart';
import 'package:arf_21/providers/my_login_proiver.dart';

import 'package:arf_21/utilities/constants.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';


 Map<String, dynamic> users =  {
  'asd': '112233',
};

class MyLoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {

    var json = {
      "username": data.name,
      "password": data.password
    };

   DataHelper.postJsonList(Constants.login, json).then((value) {
     users.addAll(value);
     User user = User.fromJson(value);
     print("user : "+user.email);
     UserPreferences().saveUser(user);
   });
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsValue(data.name)) {
        return 'User not exists';
      }

      return "";
    });

  }

//register func.
  Future<String> _registerAuthUser(LoginData data) async {

    bool check = false;

    var json = {
      "username" : data.name.split('@').first,
      "email": data.name,
      "password": data.password
    };

   await  DataHelper.registerPostJsonList(Constants.register, json).then((value) {
    if(value.statusCode == 200){
      check = true;
      User user = User(id: DateTime.now().microsecondsSinceEpoch, username: json['username']!,
          email: json['email']!, name: "", lastname: "", tc: "", image: "", adres: "",
          accessToken: "", tokenType: "");
      UserPreferences().saveUser(user);





    } else {
      print("istek girmedi "+value.statusCode.toString() );
    }
    });

    print(json);
    return Future.delayed(loginTime).then((_) {
      if (!check) {
        return 'Kayıt başarısız';
      }
      return "";
    });

  }



  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }




  @override
  Widget build(BuildContext context) {

    return
      buildFlutterLogin(context);
  }

  FlutterLogin buildFlutterLogin(BuildContext context) {
    final loginProvider = Provider.of<MyLoginProvider>(context);


    return FlutterLogin(
    hideForgotPasswordButton: true,

    messages: LoginMessages(

        userHint: "Kullanıcı adı veya mail",
        passwordHint: "Şifre",
        loginButton: "Giriş",
        signupButton: "Kayıt",

        forgotPasswordButton: "Parolamı unuttum",
        confirmPasswordHint: "Parola tekrar",
        recoverPasswordButton: "Şifremi sıfırla",
        recoverPasswordDescription: "Kullanıcı adınızı girin kayıtlı mail adresinizi kontrol edin"
    ),
    userType: LoginUserType.name,
    userValidator: (value) {
      if (value!.isEmpty){
        return "kullanıcı adı girin";
      }
    },
    title: 'ARF-21',
    logo: 'assets/images/arf.png',
    onLogin: _authUser,
    onSignup: _registerAuthUser,
    onSubmitAnimationCompleted: () {
      loginProvider.setLogin();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
       builder: (context) => HomeScreen(),
     ) );

    },
    onRecoverPassword: _recoverPassword,
  );
  }




}