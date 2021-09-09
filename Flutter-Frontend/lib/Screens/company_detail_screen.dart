

import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/company_model.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:arf_21/utilities/my_widget_decorations.dart';
import 'package:arf_21/utilities/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class CompanyDetail extends StatefulWidget {
  Company? snapshot;
  int index;

  @override
  CompanyDetail(this.snapshot, this.index);





  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}


class _CompanyDetailState extends State<CompanyDetail> {
  bool isApplied = false;

  @override
  void initState() {
    checkApplication();
    super.initState();
  }

  void checkApplication()async{
  List applies = await DataHelper.getMyApplication();
   if (applies.contains(widget.snapshot!.companyName)){
     setState(() {
       isApplied = true;
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text(
            'Firma Detayları',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.4, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 150,
                          height: 150,
                          color: Colors.white,
                          child: Image.network(widget.snapshot!.companyUrl),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.4, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.group_outlined, size: 20),
                                Text(
                                  ' ' +
                                      widget.snapshot!.employeeCount.toString(),
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.business_outlined, size: 18),
                                Text(
                                  ' ' + widget.snapshot!.companyDepartment,
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 18),
                                Text(
                                  ' ' + widget.snapshot!.establishment,
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              widget.snapshot!.companyName,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Html(
                              data: widget.snapshot!.contact,
                              style: {
                                "body": Style(
                                  fontFamily: 'Nunito',
                                  fontSize: FontSize(14.0),
                                  fontWeight: FontWeight.normal,
                                ),
                              },
                            ),
                          ),
                          Container(
                            padding:
                            EdgeInsets.only(top: 10, bottom: 3, left: 10),
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.phone_android, size: 22),
                                    Container(
                                      child: Text(
                                        '  İletişim Bilgileri',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(height: 0.5, color: Colors.grey.shade400),
                          Container(height: 10),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          widget.snapshot!.website,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: width,
                          ),
                          Container(height: 10),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.language_outlined, size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          widget.snapshot!.address,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(height: 10),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.info, size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          widget.snapshot!.companyAbout,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            margin: EdgeInsets.symmetric(vertical: 30),
                            decoration: !isApplied
                                ? buildButtonBoxDecoration(
                                Colors.green.shade900)
                                : buildButtonBoxDecoration(
                                Colors.grey),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextButton(
                                  onPressed: !isApplied ? () {
                                    AlertMessagesState()
                                        .showAskDialog(context,
                                        "Bursa başvurmak istediğinize emin misiniz ?")
                                        .then((value) {
                                      if (value) {
                                        postApplication(widget.snapshot!.id)
                                            .then((result) {
                                          if (result == 201) {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                buildCustomSnackBar(
                                                    Color(0xff003458),
                                                    "Tebrikler! Kayıt başvurunuz alındı"));
                                            setState(() {
                                              isApplied = true;
                                            });
                                          }else {
                                            print("else düştü "+result.statusCode.toString());
                                          }
                                        });
                                      }else{
                                        print("kullanıcı iptal etti");
                                      }
                                    });
                                  } : () {}
                                  , child: !isApplied ? Text(
                                  'Bursa Başvur',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ) : Text(
                                  'Başvurdun',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                                  ,)


                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 2 - 20,
                                height: width / 10,
                              ),
                              Container(
                                width: width / 2 - 20,
                                height: width / 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future postApplication(int compId) async {
    Map<String,dynamic> json = {};
    await UserPreferences().getUser().then((user) async {
      json = {
        "userId": user.id,
        "companyId": compId
      };
    });

    var sonuc = await DataHelper.postApplication(json);
    return sonuc;
  }





}