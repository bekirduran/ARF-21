import 'dart:async';

import 'package:arf_21/Screens/products_overview_screen.dart';

import 'package:arf_21/providers/product_provider.dart';
import 'package:arf_21/utilities/alert_messages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';


class CategoryGridWidget extends StatefulWidget {
  @override
  _CategoryGridWidgetState createState() => _CategoryGridWidgetState();
}

class _CategoryGridWidgetState extends State<CategoryGridWidget> {
  final mainImages = [
    "https://st1.myideasoft.com/idea/gi/18/myassets/slider_pictures/pictures_1_2.jpg?revision=1621371791",
    "https://st1.myideasoft.com/idea/du/99/myassets/slider_pictures/pictures_1_1.jpg?revision=1625133063",
    "https://st2.myideasoft.com/idea/gi/18/myassets/slider_pictures/pictures_1_3.jpg?revision=1621371791",
    "https://pbs.twimg.com/media/EDi6ECGWsAAm3P1?format=jpg&name=medium"
  ];



  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  int _currentPage = 0;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if(_pageController.hasClients){
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          bannerWidget(context),
          bannerTextWidget(),
          categoryGridViewWidget()
        ],
      ),
    );
  }

  Widget categoryGridViewWidget() {
    return Expanded(

          child: FutureBuilder(
              future: Provider.of<ProductProvider>(context).categoriesOfProduct() ,
              builder: (context, AsyncSnapshot< List<dynamic> > snapshot) {

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting: return AlertMessagesState.myCircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: ProductsOverviewScreen(
                                        snapshot.data![index].categoryName),
                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: GridTile(
                                  footer: GridTileBar(
                                    backgroundColor: Colors.black87,
                                    title: Text(
                                      "${snapshot.data![index].categoryName}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  child:
                                  Image.network(
                                    snapshot.data![index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                }

              },

          ),
        );
  }



  Container bannerTextWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xfffc8803),
        Color(0xffffdd6e),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(
        "ARF-21 Store Hoş Geldin. Alışverişe devam etmek için kategori bir seç",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
      ),
    );
  }

  Container bannerWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.27,
      child: PageIndicatorContainer(
        indicatorSelectorColor: Theme.of(context).accentColor,
        indicatorSpace: 8,
        length: mainImages.length,
        child: PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            itemCount: mainImages.length,
            itemBuilder: (context, index) =>
                CachedNetworkImage(
                  imageUrl: mainImages[index],
                  placeholder: (context, url) => AlertMessagesState.myCircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,

                         ),
                    ),
                  ),
                ),

        ),
      ),
    );
  }
}
