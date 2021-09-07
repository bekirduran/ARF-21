import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {

  bool? myOrders;
  bool? applies;
  bool? announcements;
  bool? activities;
  bool? store;


  Widget platformSwitch(BuildContext context, bool val) {
    return Switch(
      onChanged: (value) {
        setState(() {
          val = value;
          print("val: $val value: $value");
        });
      },
      value: val,
      activeColor: Color(0xff003458),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Hesap Ayarları',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Bildirimler',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Siparişler'),
                      trailing: Switch(
                        onChanged: (value) {
                          setState(() {
                            myOrders = value;
                          });
                        },
                        value: myOrders ?? true,
                        activeColor: Color(0xff003458),
                      ),
                    ),
                    ListTile(
                      title: Text('Başvurular'),
                      trailing: Switch(
                        onChanged: (value) {
                          setState(() {
                            applies = value;
                          });
                        },
                        value: applies ?? true,
                        activeColor: Color(0xff003458),
                      ),
                    ),
                    ListTile(
                      title: Text('Duyuru'),
                      trailing: Switch(
                        onChanged: (value) {
                          setState(() {
                            announcements = value;
                          });
                        },
                        value: announcements ?? true,
                        activeColor: Color(0xff003458),
                      ),
                    ),
                    ListTile(
                        title: Text('Etkinlikler'),
                      trailing: Switch(
                        onChanged: (value) {
                          setState(() {
                            activities = value;
                          });
                        },
                        value: activities ?? true,
                        activeColor: Color(0xff003458),
                      ),
                    ),
                    ListTile(
                      title: Text('Magaza'),
                      trailing: Switch(
                        onChanged: (value) {
                          setState(() {
                            store = value;
                          });
                        },
                        value: store ?? true,
                        activeColor: Color(0xff003458),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
