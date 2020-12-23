import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/main.dart';
import 'package:MyApp_Seller/screens/Loadingpage/loading.dart';
import 'package:MyApp_Seller/screens/add_goods/components/new_addpage.dart';
import 'package:MyApp_Seller/screens/edit_goods/components/new_editpage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../constants.dart';
import '../../../data.dart';
import '../../SomeThingWrong.dart';

class StatefulHomeSeller1 extends StatefulWidget {
  @override
  _StatefulHomeSeller1State createState() => _StatefulHomeSeller1State();
}

class _StatefulHomeSeller1State extends State<StatefulHomeSeller1> {
  @override
  var data;
  var order;

  void initState() {
    getData(context);
    getOrder(context);
    super.initState();
  }

  Future<int> getData(context) async {
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/myproduct';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"id": "admin"}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      Map<String, dynamic> temp = await jsonDecode(response.body);

      data = temp["msg"];
      print(data);
      //print(temp);
      //print(response.body);
      // Navigator.pushReplacement(context,
      // MaterialPageRoute(builder: (context) => ProductControl())
      // );
    } catch (e) {
      //_showsnackbar(e.toString());
    }
    return statusCode;
  }

  Future<int> getOrder(context) async {
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/myorder';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"id": "admin"}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      Map<String, dynamic> temp = await jsonDecode(response.body);

      order = temp["msg"];
      print(order);
      //print(temp);
      //print(response.body);
      // Navigator.pushReplacement(context,
      // MaterialPageRoute(builder: (context) => ProductControl())
      // );
    } catch (e) {
      //_showsnackbar(e.toString());
    }
    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*
    List<Product2> products = [
      Product2(
        namepd: 'สินค้าแนะนำ 1',
        number: '85',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 2',
        number: '104',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 3',
        number: '200',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 4',
        number: '355',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 5',
        number: '600',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 6',
        number: '700',
        image: 'assets/images/2.JPG',
      ),
      Product2(
        namepd: 'สินค้าแนะนำ 1',
        number: '85',
        image: 'assets/images/2.JPG',
      ),
    ];*/

    //get data from backend
    String nameuser = '';
    String namemyorder = '';
    String ordername = '';
    String namemyproduct = 'name';
    String number;

    return SafeArea(
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: RefreshIndicator(
              onRefresh: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (a, b, c) => DelayPage(),
                        transitionDuration: Duration(seconds: 10)));
                return Future.value(false);
              },
              child: FutureBuilder(
                future: getData(context),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return LoadingPage();
                  } else if (snapshot.data == 200) {
                    return Column(
                      children: [
                        //header
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          child: Stack(children: [
                            Container(
                              height: size.height,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(36),
                                      bottomRight: Radius.circular(36)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 19),
                                        blurRadius: 30,
                                        color: Colors.black.withOpacity((0.1)))
                                  ]),
                              child: Row(
                                children: [
                                  //welcome and name
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 60,
                                    ),
                                    height: size.height * 0.2,
                                    width: size.width * 0.6,
                                    //color: Colors.black,
                                    child: Column(
                                      children: [
                                        Text('ยินดีต้อนรับ',
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 70),
                                          child: AutoSizeText(
                                            'กลุ่มแม่บ้านพัฒนาตนเอง',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  //pic
                                  Container(
                                      height: size.height * 0.2,
                                      width: size.width * 0.3,
                                      margin: EdgeInsets.only(
                                        top: 40,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(5, 10),
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: -5)
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/images/1.jpeg')),
                                      ))
                                ],
                              ),
                            ),
                          ]),
                        ),

                        //body
                        Container(
                          height: size.height * 0.566,
                          width: size.width,
                          //margin: EdgeInsets.only(top: kDefaultPadding),
                          child: ListView(
                            children: [
                              //my order
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                height: size.height * 0.1,
                                width: size.width,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: kDefaultPadding,
                                        left: kDefaultPadding,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'ออเดอร์ของฉัน',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Spacer(),
                                          FlatButton(
                                              onPressed: () {
                                                /* Navigator.push(
                                              context,
                                          MaterialPageRoute(
                                             builder: (context) => StatefulEditGoods()),
                                          );*/
                                              },
                                              child: Container(
                                                  child: Text('เพิ่มเติม',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              color: kPrimaryColor),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.365,
                                width: size.width,
                                //color: Colors.black,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (int j = 0; j < order.length; j++) ...[
                                      if (order[j]['status'] == 'wait') ...[
                                        orderCard(
                                            name: order[j]['product'],
                                            pic: 'assets/images/2.JPG',
                                            namecustom: order[j]['buyer'],
                                            status: order[j]['status'],
                                            j: j)
                                      ] else ...[
                                        orderCardaccept(
                                            name: order[j]['product'],
                                            pic: 'assets/images/2.JPG',
                                            namecustom: order[j]['buyer'])
                                      ]
                                    ]
                                  ],
                                ),
                              ),

                              //my goods
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                height: size.height * 0.1,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: kDefaultPadding * 5,
                                        left: kDefaultPadding,
                                      ),
                                      child: Text(
                                        'สินค้าของฉัน',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.only(left: 20,right: 20),
                                child: Wrap(
                                  children: [
                                    if (data == null) ...[
                                      addgoodsCard()
                                    ] else ...[
                                      for (int i = 0;
                                          i < 3 /*data.length*/;
                                          i++) ...[
                                        goodsCard(
                                            //pic: data[i].pic,
                                            id: 'admin',
                                            pic: 'assets/images/2.JPG',
                                            //name: 's',
                                            //number: 'assets/images/2.JPG',
                                            name: data[i]['name'],
                                            detail: data[i]['detail'],
                                            catego: data[i]['section'],
                                            price: data[i]['price'],
                                            number: data[i]['pice'],
                                            map: data[i]['map'],
                                            video: data[i]['video'])
                                      ],
                                      addgoodsCard()
                                    ]

                                    //CardAddGoods(size: size)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return ErrorPage();
                  }
                },
              ))),
    );
  }

  orderCard(
      {String pic, String name, String namecustom, String status, int j}) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Container(
      height: size.height,
      width: size.width * 0.4,
      margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.15),
              spreadRadius: -10,
            )
          ]),
      child: Column(
        children: [
          //pic product
          Container(
              height: size.height * 0.145,
              width: size.width * 0.25,
              margin: EdgeInsets.only(top: kDefaultPadding),
              decoration: BoxDecoration(
                image:
                    DecorationImage(fit: BoxFit.fill, image: AssetImage(pic)),
              )),
          Container(
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
                                status = 'accept';
                                order[j]['status'] = status;
                                print(order[j]);
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
    ));
  }

  orderCardaccept({String pic, String name, String namecustom}) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      height: size.height,
      width: size.width * 0.4,
      margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.15),
              spreadRadius: -10,
            )
          ]),
      child: Column(
        children: [
          //pic product
          Container(
              height: size.height * 0.145,
              width: size.width * 0.25,
              margin: EdgeInsets.only(top: kDefaultPadding),
              decoration: BoxDecoration(
                image:
                    DecorationImage(fit: BoxFit.fill, image: AssetImage(pic)),
              )),
          Container(
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
                    child: Text(
                      'ยอมรับแล้ว',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }

  goodsCard(
      {String id,
      String pic,
      String name,
      String detail,
      String catego,
      String number,
      String price,
      String map,
      String video}) {
    Size size = MediaQuery.of(context).size;
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
                            /*
                            print(id);
                            print(name);
                            print(detail);
                            print(catego);
                            print(number);
                            print(price);
                            print(map);
                            print(video);
                            */
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatefulEditGoods1(
                                        value: Ndata(
                                            id,
                                            pic,
                                            name,
                                            detail,
                                            catego,
                                            number,
                                            price,
                                            video,
                                            map))));
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

  addgoodsCard() {
    Size size = MediaQuery.of(context).size;
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

//delay page.
class DelayPage extends StatefulWidget {
  @override
  _DelayPageState createState() => _DelayPageState();
}

class _DelayPageState extends State<DelayPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyAppJa()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //page
              Column(
                children: [
                  Container(
                      //height: size.height * 0.66,
                      height: size.height,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
