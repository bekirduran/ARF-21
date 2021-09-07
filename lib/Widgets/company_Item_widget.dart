
import 'package:arf_21/Screens/company_detail_screen.dart';
import 'package:arf_21/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class CompanyItemWidget extends StatelessWidget {
  const CompanyItemWidget({Key? key, required this.data}) : super(key: key);
  final List<Company> data;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 15;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              pushNewScreen(
                context,
                screen: CompanyDetail(data[index], index),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );


            },
            child: Tooltip(
              message: data[index].companyName,
              child: Center(
                child: Container(
                  width: itemWidth,
                  height: itemWidth,
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.4, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                      child: Image.network(data[index].companyUrl,fit: BoxFit.contain),

              ),
            ),
          )
            )
          );
        }

        );

  }
}




/* 
Column(
      children: [
        GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyDetail(data, index),
                    //Listeden hangi firmanın üzerine tıklanırsa o firmanın indexi aktarılır
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: itemWidth,
                  height: itemWidth,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 0.6, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                      child: ImageCached(
                          width: itemWidth - 50,
                          height: itemWidth - 50,
                          url: data.)),
                ),
              ),
            );
          }),
        )
      ],
    );
*/