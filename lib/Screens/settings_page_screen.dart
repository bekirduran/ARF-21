

import 'package:arf_21/Screens/login_screen_2.dart';
import 'package:arf_21/Screens/my_login_screen.dart';
import 'package:arf_21/Screens/my_profile_edit.dart';
import 'package:arf_21/Screens/notification_settings_screen.dart';
import 'package:arf_21/providers/my_login_proiver.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final log = Provider.of<MyLoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff003458),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: LayoutBuilder(
            builder:(builder,constraints)=> SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Genel',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),

                      Divider(),
                      ListTile(
                        title: Text('Dil seçenekleri A / का'),
                        leading: Icon(Icons.language,color: Color(0xff003458),),
                        onTap: () {

                        },
                      ),

                      Divider(),

                      ListTile(
                        title: Text('Bildirimler'),
                        leading: Icon(Icons.notifications_active_outlined,color: Color(0xff003458)),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: NotificationSettingsScreen(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
                      Divider(),

                      ListTile(
                        title: Text('Şartlar & Hakkında'),
                        leading: Icon(CupertinoIcons.book_circle,color: Color(0xff003458)),
                        onTap: () {

                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Üyelik Bilgilerim'),
                        leading: Icon(CupertinoIcons.info,color: Color(0xff003458)),
                        onTap: (){
                          pushNewScreen(
                            context,
                            screen: MyProfileEdit(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Hesap',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Parola Değiştir'),
                        leading: Icon(CupertinoIcons.lock,color: Color(0xff003458)),
                        onTap: () {

                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Çıkış'),
                        leading: Icon(Icons.login_rounded,color: Color(0xff003458)),
                        onTap:() {
                          UserPreferences().removeUser();
                          log.removeLogin();

                          Navigator.of(context).pushAndRemoveUntil(
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return LoginScreen2();
                              },
                            ),
                                (_) => false,
                          );

                        },
                      ),

                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }

}