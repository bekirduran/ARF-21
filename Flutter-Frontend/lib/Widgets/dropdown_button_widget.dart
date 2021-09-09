import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
   String dropdownValue = "1";

  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {


  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(

        value: widget.dropdownValue,
        icon:  Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.arrow_downward),
        ),
        iconSize: 20,
        style: const TextStyle(color: Colors.black87),


        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownValue = newValue!;
          });
        },
        items: <String>['1', '2', '3', '4','5']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text("Ürün adeti : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                  Text(value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
