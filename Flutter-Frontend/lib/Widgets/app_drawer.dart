import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Screens/orders_screen.dart';
import '../Screens/shop_welcome_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
          child: Column(
            children: [

              CircleAvatar(
                maxRadius: 48,
                backgroundImage: CachedNetworkImageProvider(
                    "https://image.flaticon.com/icons/png/512/147/147144.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Bekir Duran',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              ListTile(
                  leading: Icon(Icons.shop),
                  title: Text("Shop"),
                  onTap: () {

                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return ShopWelcomeScreen();
                        },
                      ),
                    );
                  }
                  ),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text("Siparislerim"),
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: OrdersScreen(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );

                }

              ),
            ],
          ),
        ),
      ),
    );
  }
}
