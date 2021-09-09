
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AttributeDropDownButton extends StatefulWidget {
 final List<String> attributes;
 String ?selectedAttribute;
 AttributeDropDownButton(this.attributes);



  @override
  _AttributeDropDownButtonState createState() => _AttributeDropDownButtonState();
}

class _AttributeDropDownButtonState extends State<AttributeDropDownButton> {

  String ?selection;

@override
  void initState() {
      selection = widget.attributes.first;
      widget.selectedAttribute = selection;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 0.5),borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 0,bottom: 10),
        width: MediaQuery.of(context).size.width /1.8,
        height: 40,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(

            value: selection,
            icon:  Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(Icons.arrow_downward),
            ),
            iconSize: 20,
            style: const TextStyle(color: Colors.black87),
            isDense: true,


            onChanged: (String? newValue) {
              setState(() {
                selection = newValue!;
                widget.selectedAttribute = selection;
               print(selection);
              });
            },
            items: widget.attributes.map<DropdownMenuItem<String>>((String value)  {
             return DropdownMenuItem<String>(
               value: value.toString() ,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
                 child: Row(
                   children: [
                     Text("Seçiminiz : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                     Text(value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                   ],
                 ),
               ),
             );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
