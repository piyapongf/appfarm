import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/data.dart';
import 'package:MyApp_Seller/screens/add_goods/components/new_addpage.dart';
import 'package:MyApp_Seller/screens/edit_goods/components/new_editpage.dart';
import 'package:MyApp_Seller/screens/home_seller/components/%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7/textmygoods.dart';
import 'package:MyApp_Seller/screens/home_seller/components/%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7/welcomeandprofile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class BodySeller extends StatefulWidget {
  @override
  _BodySellerState createState() => _BodySellerState();
}

class _BodySellerState extends State<BodySeller> {
  //String pic;
  //เก็บมาจากหน้า adddetail

  
  String name = 'ชื่อสินค้า';
  String detail = 'รายละเอียด';
  String number = 'จำนวนสินค้า';
  String catego = 'หมวดหมู่';

  /* //get data by local storage
  @override
  void goodsdata() {
    getData();
  }

  getData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      name = data.getString('name');
      detail = data.getString('detail');
      number = data.getString('number');
      catego = data.getString('catego');
      //print(name);
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(name);
    print(catego);
    //goodsdata(); //call method

    return SafeArea(
      child: Column(
        children: [
          WelcomeAndProfile(size: size, picprofile: 'assets/images/1.jpeg'),
          Container(
            height: size.height * 0.575,
            child: Container(
              padding: EdgeInsets.only(top: kDefaultPadding),
              child: ListView(
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 20),
                    child: Textmygoods(text: 'ออเดอร์ของฉัน'),
                  ),
                  Container(
                    //color: Colors. black,
                    height: 250, width: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardOrder(
                            size: size,
                            name: name,
                            pic: 'assets/images/2.JPG',
                            namecustom: 'namecustom1',
                            number: number),
                        CardOrder(
                            size: size,
                            name: name,
                            pic: 'assets/images/2.JPG',
                            namecustom: 'namecustom2',
                            number: number),
                        CardOrder(
                            size: size,
                            name: name,
                            pic: 'assets/images/2.JPG',
                            namecustom: 'namecustom3',
                            number: number),
                      ],
                    ),
                  ),
                  Wrap(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Textmygoods(text: 'สินค้าของฉัน')),
                      CardGoods(
                        size: size,
                        pic: 'assets/images/2.JPG',
                        name: name,
                        number: number,
                      ),
                      CardAddGoods(size: size)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardOrder extends StatelessWidget {
  const CardOrder({
    Key key,
    @required this.size,
    @required this.namecustom,
    @required this.number,
    this.pic,
    this.name,
  }) : super(key: key);

  final Size size;
  final String pic;
  final String name;
  final String namecustom;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.35,
        margin: EdgeInsets.only(
            top: kDefaultPadding * 0.3,
            right: kDefaultPadding,
            left: kDefaultPadding,
            bottom: kDefaultPadding * 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.075),
                  spreadRadius: -15)
            ]),
        child: Column(
          children: [
            Container(
                height: 110,
                width: 110,
                margin: EdgeInsets.only(top: kDefaultPadding),
                decoration: BoxDecoration(
                  image:
                      DecorationImage(fit: BoxFit.fill, image: AssetImage(pic)),
                )),
            Container(
              //padding: EdgeInsets.all(kDefaultPadding + 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.35,
                    child: Text(
                      name,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: size.width * 0.35,
                    child: AutoSizeText(
                      'ชื่อผู้สั่ง $namecustom ',
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 130,
                    padding: EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Container(
                            //buttom
                            width: 60,
                            height: 40,
                            child: FlatButton(
                                onPressed: () {
                                  /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatefulEditGoods()),
                                  );*/
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 32.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)),
                                color: Colors.green),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: -15)
                            ])),
                        Spacer(),
                        Container(
                            //buttom
                            width: 60,
                            height: 40,
                            child: FlatButton(
                                onPressed: () {
                                  /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatefulEditGoods()),
                                  );*/
                                },
                                child: Icon(
                                  Icons.clear_rounded,
                                  color: Colors.black,
                                  size: 32.0,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)),
                                color: Colors.red),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: -15)
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardAddGoods extends StatelessWidget {
  const CardAddGoods({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.35,
        margin: EdgeInsets.only(
            top: kDefaultPadding * 0.3,
            right: kDefaultPadding,
            left: kDefaultPadding,
            bottom: kDefaultPadding * 0.3),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.075),
                  spreadRadius: -15)
            ]),
        child: Column(
          children: [
            Container(
              height: size.height * 0.35,
              width: size.width * 0.4,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StatefulAddGoods1()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.all(kDefaultPadding*0.2),
                      margin: EdgeInsets.only(top: 50),
                      child: Icon(
                        Icons.add_sharp,
                        color: Colors.grey,
                        size: 120,
                      ),
                    ),
                    Text(
                      'เพิ่มสินค้า',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardGoods extends StatelessWidget {
  const CardGoods(
      {Key key, @required this.size, this.pic, this.name, this.number})
      : super(key: key);

  final Size size;
  final String pic;
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.35,
        margin: EdgeInsets.only(
            top: kDefaultPadding * 0.3,
            right: kDefaultPadding,
            left: kDefaultPadding,
            bottom: kDefaultPadding * 0.3),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.075),
                  spreadRadius: -15)
            ]),
        child: Column(
          children: [
            Container(
                height: 110,
                width: 110,
                margin: EdgeInsets.only(top: kDefaultPadding),
                decoration: BoxDecoration(
                  image:
                      DecorationImage(fit: BoxFit.fill, image: AssetImage(pic)),
                )),
            Container(
              //padding: EdgeInsets.all(kDefaultPadding + 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    //name
                    width: size.width * 0.35,
                    child: Text(
                      name,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    // number
                    width: size.width * 0.35,
                    child: AutoSizeText(
                      'มีสินค้าอยู่: $number ชิ้น ',
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                      //buttom
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatefulEditGoods1()),
                            );
                          },
                          child: Text(
                            'แก้ไขข้อมูล',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xFFFFF9C4)),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: -15)
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
