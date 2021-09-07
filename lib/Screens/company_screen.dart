
import 'package:arf_21/Widgets/company_Item_widget.dart';
import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/company_model.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  late Company company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Burs ilanı olan firmalar")),),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
        child: FutureBuilder<List<Company>>(
          future: DataHelper.fetchCompany(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState){
                case ConnectionState.waiting:
                  return AlertMessagesState.myCircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else
                    return CompanyItemWidget(data: snapshot.data!);
              }
            }
        ),
      ),
    );
  }
}
