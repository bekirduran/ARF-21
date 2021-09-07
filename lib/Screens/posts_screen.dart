import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(colors: [
                        Color(0xffd3f5f5),
                        Colors.white,
                        Color(0xffD3F5F5FF)
                      ], end: Alignment.bottomRight, begin: Alignment.topLeft)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  child: Image.network(
                                      "https://image.flaticon.com/icons/png/512/147/147144.png"),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bekir Duran",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text("45 dakika önce",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () => print("more tapped"),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Tokyo 2020 Paralimpik Oyunları olarak "
                            "adlandırılan 2020 Yaz Paralimpik Paralimpikleri, "
                            "Uluslararası Paralimpik Komitesi tarafından yönetilen, "
                            "yaklaşan büyük bir uluslararası çok sporlu parasports etkinliğidir."),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => null,
                              icon: Icon(Icons.favorite_border)),
                          IconButton(
                              onPressed: () => null,
                              icon: Icon(Icons.comment_outlined))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
