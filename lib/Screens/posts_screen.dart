import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {

  Random random = new Random();

  List<String> user = ["Bekir Duran","Emin Şimşek", "Enez Mutluoğlu","Habip Yakar","Bahadır Tıraş","Osman Gezgen","Ahmet Metiç Ünal","Çağla Su"];
  List<String> posts = [
    "Her insan kendini konuşarak anlatır. Çoğumuz söyleyeceklerimizin düşündüğümüz şekilde anlaşılmasını isteriz. Çünkü insanlar sizin ne düşündüğünüzü veya ne hissettiğinizi bilmez sadece kendinizi nasıl ifade ettiğinize bakarlar",
    "İnovatif düşünce ilk olarak toplumun inovasyon kültürünü benimsemesi ile hayata geçer.",
    "Problemi teşhis etme süreci; inovatif düşüncenin başlangıçtaki ilk aşaması problemin doğru tespitidir.",
    "Dijital çağ olarak bilinen 21. yüzyılda, geleneksel pazarlama kavramı gelişerek, işlerinizi geliştirmeye ve büyütmeye yarayacak yeni beceri ile yetenekler elde etmeyi amaçlayan dijital pazarlama kavramı ortaya çıkmıştır. ",
    "Günümüzün yoğun rekabet ortamında, marka itibarının koruması işletmelerin gündemindeki en önemli konulardan biridir. Bu nedenle kriz yönetimi içerisinde bulunduğumuz bu çağda markalar için son derece önemlidir.",
    "Yüksek IQ'ya sahip insanlar, okul sadece akademik başarılarla sınırlı olduğu için başarılı olamayabilir. Örneğin, birçok öğrencinin okuldan sonra eğlenceli bir şey üzerinde çalışmak için yeterli zamanı veya enerjisi yoktur.",
    "Her birimizin kendimiz olabileceği alana ihtiyacı var. Özgürlük alanı, insana saygınlık sağlayan yaşam alanı olmalı.",
    "Yeni çağın popüler mesleklerinden biri olan online içerik yazarlığını bir meslek olarak yapmayı düşünüyorsanız, nasıl içerik yazarı olabileceğiniz hakkında izlemeniz gereken yolları yazı boyunca okuyarak öğrenebilirsiniz. ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: user.length,
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
                                  child: Icon(Icons.person),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(random.nextInt(59).toString()+" dakika önce",
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
                        child: Text(posts[index]),
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
