import 'package:arf_21/databases/data_helper.dart';
import 'package:arf_21/models/company_model.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApplies extends StatefulWidget {
  const MyApplies({Key? key}) : super(key: key);

  @override
  _MyAppliesState createState() => _MyAppliesState();
}

class _MyAppliesState extends State<MyApplies> {


  List<Company> list = [];
  late List applies = [];

  loadComp() async {
    await DataHelper.fetchCompany().then((value) => list.addAll(value));
     applies = await DataHelper.getMyApplication();
  }

  @override
  void initState() {
    loadComp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burs Başvurularım"),),
        body: FutureBuilder<dynamic>(
          future:DataHelper.getMyApplication(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return AlertMessagesState.myCircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            leading: CircleAvatar(backgroundColor: Color(0xff003458),child: Text((index + 1).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                            title: Text(snapshot.data[index].toString(),style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w800,fontSize: 17)),
                            trailing: Text("Başvuruldu",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),)
                        ),
                      );
                    },
                  );
            }
          },

        )
    );
  }


}


