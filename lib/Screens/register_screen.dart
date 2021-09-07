
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:arf_21/utilities/constants.dart';
import 'package:arf_21/utilities/login_constants.dart';
import 'package:arf_21/utilities/my_widget_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}





class _RegisterScreenState extends State<RegisterScreen> {
  bool buttonClicked = false;
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var userController = TextEditingController();




  Widget _buildUserNameTF() {
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
            controller:userController ,
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

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Mail adresini girin',
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

  Text _buttonText(){
    return Text(
      'Kayıt',
      style: TextStyle(
        color: Color(0xFF527DAA),
        letterSpacing: 1.5,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    );
}

  Widget _buildLoginBtn(BuildContext contex) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:!buttonClicked? () {
          var json = {
            "email":emailController.text,
            "username": userController.text,
            "password": passController.text
          };
        _submitRegister(json,context);
        }:(){},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child:!buttonClicked?_buttonText():AlertMessagesState.myCircularProgressIndicator() ,
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Zaten hesabınız var mı?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' Giriş yap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitRegister(Map<String, String> json, BuildContext context)async {
    setState(() {
      buttonClicked = true;
    });

    try{
    await DataHelper.postJsonList(Constants.register, json).then((value) {
      if (value.statusCode == 200){

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Colors.greenAccent, "Tebrikler! Kayıt başarılı"));
        Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).pop());
        setState(() {
          buttonClicked = false;
        });
      }else {
        setState(() {
          buttonClicked = false;
        });
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Colors.redAccent, "Kayıt başarısız"));

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

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    userController.dispose();
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
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Kayıt Ol',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildUserNameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildLoginBtn(context),
                      _buildSignupBtn()
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
