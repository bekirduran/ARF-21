import 'dart:convert';

import 'package:arf_21/Screens/register_screen.dart';
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/user.dart';
import 'package:arf_21/providers/my_login_proiver.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:arf_21/utilities/login_constants.dart';
import 'package:arf_21/utilities/my_widget_decorations.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screeen.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}



class _LoginScreen2State extends State<LoginScreen2> {
  bool _rememberMe = false;
  bool buttonClicked = false;
  var emailController = TextEditingController();
  var passController = TextEditingController();


  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Kullanıcı adı',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller:emailController ,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Kullanıcı adınızı girin',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Şifrenizi girin',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged:_handleRemember,
            ),
          ),
          Text(
            'Beni hatırla',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Text _buttonText(){
    return Text(
      'Giriş',
      style: TextStyle(
        color: Color(0xFF527DAA),
        letterSpacing: 1.5,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    );
  }

  Widget _buildLoginBtn() {


    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:!buttonClicked? () {
          var json = {
            "username": emailController.text,
            "password": passController.text
          };
          _submitLogin(json,context);
        }:(){},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: !buttonClicked? _buttonText():AlertMessagesState.myCircularProgressIndicator(),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () =>             Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ) ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hesabın yok mu?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' Hemen kayıt ol',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitLogin(Map<String, String> json, BuildContext context) async{
    setState(() {
      buttonClicked = true;
    });
    final loginProvider = Provider.of<MyLoginProvider>(context,listen: false);

    try{

    await DataHelper.postJsonList(Constants.login, json).then((value) {
        if (value.statusCode == 200){
          final response = jsonDecode(value.body);
          if(response.containsValue(emailController.text)){
            User user = User.fromJson(response);
            print("user : "+user.email);
            UserPreferences().saveUser(user);
            loginProvider.setLogin();
            _removeRemember();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ) );

          }else{
            setState(() {
              buttonClicked = false;
            });
            print("mail adresi bulunamadı");
          }

        }else{
          setState(() {
            buttonClicked = false;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Colors.redAccent, "Geçersiz kullanıcı adı ve şifre"));
        }
    });
    }catch(e){
      setState(() {
        buttonClicked = false;
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Colors.redAccent, "İstek zaman aşımına uğradı"));

    }
  }
  void _handleRemember(bool? value) {

    _rememberMe = value!;
    SharedPreferences.getInstance().then((pref) {
      pref.setBool("remember", value);
      pref.setString("r_email", emailController.text);
      pref.setString("r_password", passController.text);
    });
    setState(() {
      _rememberMe = value;
    });
  }
  void _loadRemember()async{
    try {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      String _email = _pref.getString("r_email") ?? "";
      String _password = _pref.getString("r_password") ?? "";
      bool _remember = _pref.getBool("remember") ?? false;

      if(_remember){
        setState(() {
        _rememberMe = _remember;
        });
      }
      emailController.text = _email ;
      passController.text = _password ;

    }catch(e){
      print(e);
    }
  }
  void _removeRemember()async{
    if(!_rememberMe){
      try {
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.remove("r_email");
        _pref.remove("r_password");
        _pref.setBool("remember",false);
      }catch(e){
        print(e);
      }
    }
  }

@override
  void initState() {
  _loadRemember();
  super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xff003458),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                 /*     Text(
                        'ARF-21 Oturum Açın',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      */
                      Container(
                          height: 250,
                          width: 250,
                          child: Image.asset('assets/images/arf.png',fit: BoxFit.cover,)),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




}
