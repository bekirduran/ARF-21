import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
class AlertMessages extends StatefulWidget {
  @override
  AlertMessagesState createState() => AlertMessagesState();
}

class AlertMessagesState extends State<AlertMessages> {

 CircleAvatar dialogWarning(){
  return CircleAvatar(child: Icon(Icons.flag_outlined,size: 40,color:  Color(0xffdff8fe),),radius: 40,backgroundColor: Color(0xfff01159) ,);
}

 CircleAvatar dialogSuccess(){
   return CircleAvatar(child: Icon(Icons.where_to_vote_sharp,size: 40,color:  Color(0xffdff8fe),),radius: 40,backgroundColor: Colors.green ,);
 }

 CircleAvatar dialogQustion(){
   return CircleAvatar(child: Icon(CupertinoIcons.question,size: 40,color:  Color(0xffdff8fe),),radius: 40,backgroundColor: Colors.yellow ,);
 }

  void showDialogBox(BuildContext context, String message,String buttonText,bool warning,{String title = ""}) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0) ),
          title: warning?dialogWarning():dialogSuccess(),
          content: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          actions: <Widget>[

            Center(
              child: new TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xff003458)),
                child: new Text(buttonText,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }


 Future<bool> showAskDialog(BuildContext context, String message,{String title = ""}) async{
return await
   showDialog(

     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0) ),
         title: dialogQustion(),
         content: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
         actions: <Widget>[

           Center(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 new TextButton(
                   style: TextButton.styleFrom(backgroundColor: Color(0xff003458)),
                   child: new Text("İptal",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                   onPressed: () {
                     Navigator.of(context).pop(false);
                   },
                 ),

             new TextButton(
                   style: TextButton.styleFrom(backgroundColor: Color(0xff003458)),
                   child: new Text("Başvur",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                   onPressed: ()  {

                     Navigator.of(context).pop(true);

                   },
                 )
               ],
             ),
           ),
         ],
       );
     },
   );
 }





 static void onLoading(BuildContext context,Widget screen) {
   showDialog(
     barrierColor: Colors.transparent,
     context: context,
     barrierDismissible: false,
     builder: (BuildContext context) {
       return BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
         child: Dialog(
           backgroundColor: Colors.transparent,
           elevation: 0,
           child:  Center(
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                  //myCircularProgressIndicator(),
                 Container(
                   decoration: BoxDecoration(
                   ),
                   child: Image.asset(
                     'assets/images/arf.png',
                     width: 50,
                     height: 50,
                     color: Color(0xFFDBBA4E),
                   ),
                 ),

                  SizedBox(width: 10,),
                  Text("Loading"),
               ],
             ),
           ),
         ),
       );
     },
   );
   new Future.delayed(new Duration(milliseconds: 350), () {

     Navigator.pop(context);
     pushNewScreen(
       context,
       screen: screen,
       withNavBar: true, // OPTIONAL VALUE. True by default.
       pageTransitionAnimation: PageTransitionAnimation.cupertino,
     );


   });
 }

 static Widget myCircularProgressIndicator() {
   return Center(child: Container(height: 19,width: 19,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff003458)),backgroundColor: Color(0xff82cde5))));

}


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}