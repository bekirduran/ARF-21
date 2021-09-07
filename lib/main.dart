
import 'package:arf_21/Screens/home_screeen.dart';
import 'package:arf_21/Screens/login_screen_2.dart';
import 'package:arf_21/providers/cart.dart';
import 'package:arf_21/providers/my_login_proiver.dart';
import 'package:arf_21/providers/order.dart';
import 'package:arf_21/providers/product_provider.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Screens/my_login_screen.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => ProductProvider()),
    ChangeNotifierProvider(create: (ctx) => Cart()),
    ChangeNotifierProvider(create: (ctx) => Order()),
    ChangeNotifierProvider(create: (ctx) => MyLoginProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff003458),
        accentColor: Color(0xfff01159),
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future:Provider.of<MyLoginProvider>(context).getLogin(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(body: AlertMessagesState.myCircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return snapshot.data! ? HomeScreen() : LoginScreen2();
          }
        },
      ),
    );
  }
}
