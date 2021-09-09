import 'package:arf_21/models/user.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arf_21/utilities/my_widget_decorations.dart';

class MyProfileEdit extends StatefulWidget {
  const MyProfileEdit({Key? key}) : super(key: key);

  @override
  _MyProfileEditState createState() => _MyProfileEditState();
}



class _MyProfileEditState extends State<MyProfileEdit> {

  final formKey = new GlobalKey<FormState>();

  final _usernameC = TextEditingController();
  final _emailC = TextEditingController();
  final _nameC = TextEditingController();
  final _lastnameC = TextEditingController();
  final _tcC = TextEditingController();
  final _adresC = TextEditingController();

  @override
  void initState() {
    Future<User> _user = UserPreferences().getUser();
        _user.then((user) {
        _usernameC.text = user.username;
        _emailC.text = user.email;
        _nameC.text = user.name;
        _lastnameC.text = user.lastname;
        _tcC.text = user.tc;
        _adresC.text = user.adres;
    });
    super.initState();
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
      body: FutureBuilder(
          future: UserPreferences().getUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return SafeArea(
                      child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              'Bilgilerimi Güncelle',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          Flexible(
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.person),
                                  title: buildTextFormField(
                                      snapshot.data!.username,"Kullanıcı adı", _usernameC),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(Icons.email),
                                  title: buildTextFormField(
                                      snapshot.data!.email,"Email", _emailC),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading:
                                      Icon(Icons.drive_file_rename_outline),
                                  title: buildTextFormField(
                                      snapshot.data!.name,"Adı", _nameC),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading:
                                      Icon(Icons.drive_file_rename_outline),
                                  title: buildTextFormField(
                                      snapshot.data!.lastname,"Soyadı",_lastnameC),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(Icons.perm_identity),
                                  title: buildTextFormField(
                                      snapshot.data!.tc,"Tc",_tcC),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(Icons.my_location),
                                  title: buildTextFormField(
                                      snapshot.data!.adres,"Adres",_adresC),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: buildButtonBoxDecoration(
                                          Color(0xff003458)),
                                      child: TextButton(
                                          onPressed: () {

                                              User newuser = User(
                                                  id: snapshot.data!.id,
                                                  username: _usernameC.text,
                                                  email: _emailC.text,
                                                  name: _nameC.text,
                                                  lastname: _lastnameC.text,
                                                  tc: _tcC.text,
                                                  image: snapshot.data!.image,
                                                  adres: _adresC.text,
                                                  accessToken: snapshot
                                                      .data!.accessToken,
                                                  tokenType:
                                                      snapshot.data!.tokenType);
                                              print(newuser.email);
                                              UserPreferences().saveUser(newuser);
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                              ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Colors.green.shade800, "Güncelleme başarılı"));
                                              Future.delayed(Duration(seconds: 1)).then((value) => Navigator.of(context).pop());


                                          },
                                          child: Text(
                                            "Güncelle",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }
          }),
    );
  }

  TextFormField buildTextFormField(String text,String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      validator: (value) =>          value!.isEmpty ? ' Lütfen geçerli bir değer girin' : null,
      decoration: buildInputDecoration(hint,hint: hint),
    );
  }

  void _submit() {}
}
