import 'package:arf_21/Screens/home_screeen.dart';
import 'package:arf_21/Screens/my_applies.dart';
import 'package:arf_21/Screens/posts_screen.dart';
import 'package:arf_21/Screens/settings_page_screen.dart';
import 'package:arf_21/models/user.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: CachedNetworkImageProvider(
                      "https://image.flaticon.com/icons/png/512/147/147144.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<User>(
                    future:UserPreferences().getUser() ,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState){
                        case ConnectionState.waiting:
                          return AlertMessagesState.myCircularProgressIndicator();
                        default:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          else
                            return Text(snapshot.data!.email, style: TextStyle(fontWeight: FontWeight.bold),);
                      }
                    }
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff003458).withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/images/wallet.png'),
                              onPressed: () {

                                pushNewScreen(
                                    context,
                                    screen: OrdersScreen(),
                                withNavBar: true,
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            Text(
                              'Siparişler',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/images/list.png'),
                              onPressed: () {

                                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return HomeScreen();
                                    },
                                  ),
                                      (_) => true,
                                );

                              },
                            ),
                            Text(
                              'Gönderiler',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/images/fav.png'),
                              onPressed: () {},
                            ),
                            Text(
                              'Favoriler',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/images/contact_us.png'),
                              onPressed: () {

                                pushNewScreen(
                                  context,
                                  screen: MyApplies(),
                                  withNavBar: true,
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            Text(
                              'Başvurular',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                ListTile(
                  title: Text('Destek'),
                  subtitle: Text('Yardım ve Sık sorulanlar'),
                  leading: Image.asset('assets/images/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Color(0xff003458),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Duyurular'),
                  subtitle: Text('İlan ve Etkinlikler'),
                  leading: Image.asset('assets/images/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: Color(0xff003458)),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text('Hesap Ayarları'),
                  subtitle: Text('Bildirimler ve Çıkış'),
                  leading: Image.asset(
                    'assets/images/settings.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right, color: Color(0xff003458)),
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: SettingsPage(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                ),

                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
