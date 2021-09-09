import 'package:arf_21/Widgets/attribute_dropdown_button_widget.dart';
import 'package:arf_21/Widgets/dropdown_button_widget.dart';
import 'package:arf_21/providers/cart.dart';
import 'package:arf_21/providers/product.dart';
import 'package:arf_21/utilities/my_widget_decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';
  final Product? openedProduct;

  const ProductDetailScreen({Key? key, this.openedProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);

    PageController _pageController =
        PageController(initialPage: 0, keepPage: true);

    List<String> test =
        openedProduct!.attributeValues.map((e) => e.value).toList();
    MyDropDownButton quantity = MyDropDownButton();
    AttributeDropDownButton attributeDropDownButton =
        AttributeDropDownButton(test);

    print(test);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,

        ),
        iconTheme: IconThemeData(color: Colors.white,size: 14),
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productTitleWidget(),
              productPriceWidget(),
              productPictures(context, _pageController),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(color: Colors.black54, width: 1)),
                        child: quantity),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      decoration:
                          buildButtonBoxDecoration(Colors.tealAccent.shade700),
                      child: TextButton(
                        child: Text(
                          "Sepete at",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          cartProvider.addItem(
                              openedProduct!.id,
                              openedProduct!.id,
                              openedProduct!.title,
                              openedProduct!.price,
                              int.parse(quantity.dropdownValue),
                              attributeDropDownButton.selectedAttribute ?? "",
                              openedProduct!.imageUrl.first);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(buildCustomSnackBar(Color(0xff003458), openedProduct!.title + " sepete eklendi"));

                        },
                      ),
                    )
                  ],
                ),
              ),
              openedProduct!.attributeValues.isNotEmpty
                  ? attributeDropDownButton
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(openedProduct!.description,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productPriceWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Chip(
        label: Text(
          openedProduct!.price.toString() + " TL",
          style: TextStyle(
              fontSize: 22,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding productTitleWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      child: Text(
        openedProduct!.title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget productPictures(BuildContext context, PageController _pageController) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      child: Stack(children: [
        PageIndicatorContainer(
            indicatorColor: Colors.black26,
            indicatorSelectorColor: Theme.of(context).accentColor,
            indicatorSpace: 8,
            length: openedProduct!.imageUrl.length,
            child: PageView.builder(
                controller: _pageController,
                pageSnapping: true,
                itemCount: openedProduct!.imageUrl.length,
                itemBuilder: (context, index) => Image.network(
                      openedProduct!.imageUrl[index],
                      fit: BoxFit.cover,
                    ))),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: 50, width: 50, child: InkWell(onTap:() {
              _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              } ,child: Icon(CupertinoIcons.left_chevron))),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 50,
            width: 50,
            child: InkWell(onTap: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },child: Icon(CupertinoIcons.right_chevron)),
          ),
        )
      ]),
    );
  }
}
