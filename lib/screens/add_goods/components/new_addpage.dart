import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:http/http.dart';
//import 'package:image_picker_modern/image_picker_modern.dart';

class StatefulAddGoods1 extends StatefulWidget {
  @override
  _StatefulAddGoods1State createState() => _StatefulAddGoods1State();
}

class _StatefulAddGoods1State extends State<StatefulAddGoods1> {
  File pic;

  String picc =
      'https://www.chula.ac.th/wp-content/uploads/2018/03/cu_inside_21112016.jpg';
  //https://www.eatforhealth.gov.au/sites/default/files/images/the_guidelines/fruit_selection_155265101_web.jpg
  String selectcategory='';
  String name;
  String detail;
  String price;
  //int number;
  String number;
  String catego;
  String id = 'admin';

  final namecon = TextEditingController();
  final detailcon = TextEditingController();
  final numbercon = TextEditingController();
  final pricecon = TextEditingController();
  final categocon = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pic = image;
      //print('image: $pic'); //test
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void showpopup(BuildContext context, String x, color) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(x,
                    style: TextStyle(
                      color: color,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),),
                
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
          barrierDismissible: false);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            NestedScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoIsScrolled) {
                return [
                  //header
                  SliverAppBar(
                    backgroundColor: kPrimaryColor,
                    expandedHeight: size.height * 0.2,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        'เพิ่มสินค้า',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(36))),
                  )
                ];
              },
              body: Container(
                height: size.height * 0.2,
                child: Column(
                  children: [
                    //body
                    Container(
                      height: size.height * 0.85,
                      width: size.width,
                      child: Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: kDefaultPadding),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 5,
                                          top: 20),
                                      /*height: 180,
                                              width: 200,*/
                                      height: size.height * 0.3,
                                      width: size.width * 0.55,
                                      //color: Colors.white,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: size.height * 0.3,
                                            width: size.width * 0.55,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(45)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0, 0),
                                                      blurRadius: 0,
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1)
                                                ]),
                                            child: FlatButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(45)),
                                              ),
                                              onPressed: () {
                                                //choseImage();
                                                getImage();
                                              },
                                              child: pic == null
                                                  ? Icon(Icons.add_a_photo,
                                                      color: Colors.grey,
                                                      size: 100)
                                                  : Image.file(pic),
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                    padding:
                                        EdgeInsets.all(kDefaultPadding * 0.4),
                                    child: Text(
                                      'รูปสินค้า',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ชื่อสินค้า',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            //get name
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'ชื่อสินค้า',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60)))),
                                controller: namecon,
                                onChanged: (String value) {
                                  name = value;
                                },
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                'รายละเอียด',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),

                            //get detail
                            Container(
                              //detail
                              padding: EdgeInsets.only(bottom: 20),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    hintText: 'รายละเอียด',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                                controller: detailcon,
                                onChanged: (String value) {
                                  detail = value;
                                },
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                            ),

                            //get number and get price
                            Container(
                              width: size.width,
                              //color: Colors.red,
                              height: size.height * 0.19,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, right: 15),
                                        child: Text(
                                          'จำนวนสินค้า',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.4,
                                        //padding: EdgeInsets.only(bottom: 20),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'จำนวนสินค้า',
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              60)))),
                                          controller: numbercon,
                                          onChanged: (String value) {
                                            //number = numbercon as int;
                                            number = value;
                                          },
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, right: 15),
                                        child: Text(
                                          'ราคาสินค้า',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.5,
                                        padding: EdgeInsets.only(left: 30),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'ราคาสินค้า',
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              60)))),
                                          controller: pricecon,
                                          onChanged: (String value) {
                                            price = value;
                                          },
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                'หมวดหมู่',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),

                            //get category
                            Container(
                                height: 90,
                                padding: EdgeInsets.only(bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(60)),
                                      border: Border.all(
                                          color: Colors.grey, width: 1.5)),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    onPressed: () => Category(),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            selectcategory, //have to elect category
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'แผนที่',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '*ไม่จำเป็นต้องใส่ก็ได้',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),

                            //button add address
                            Container(
                              //button add address
                              padding: EdgeInsets.only(bottom: 20),
                              height: 90,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5)),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60)),
                                  onPressed: () {
                                    /*go to map page*/
                                    /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MapScreen()),
                                          );*/
                                  },
                                  child: Text(
                                    'กดเพื่อเพิ่ม',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //color: Color(0xFFFFF9C4)
                                  //color: kPrimaryColor
                                ),
                              ),
                            ),

                            //button add video
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'วิดีโอ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '*ไม่จำเป็นต้องใส่ก็ได้',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),

                            //button add address
                            Container(
                              //button add address
                              padding: EdgeInsets.only(bottom: 20),
                              height: 90,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5)),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60)),
                                  onPressed: () {
                                    /*go to map page*/
                                    /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MapScreen()),
                                          );*/
                                  },
                                  child: Text(
                                    'กดเพื่อเพิ่ม',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //color: Color(0xFFFFF9C4)
                                  //color: kPrimaryColor
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //button add
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.12,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.12,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                        ),
                        onPressed: () async {
                          //test getting data
                          /* print(name);
                          print(detail);
                          print(number);
                          print(price);
                          print(catego);
                          print('pic : $pic');*/

                          //sent to server
                          try {
                            if (name == null || detail == null || number == null || price == null || catego == null || picc == null) {
                              const color = Colors.red;
                              //print('sad');
                              showpopup(context, 'เพิ่มไม่สำเร็จ', color);
                            } else {
                              
                              String url =
                                  'http://188.166.251.25:2000/addproduct';
                              Map<String, String> headers = {
                                "Content-type": "application/json"
                              };
                              String json =
                                  '{"id": "admin","name":"$name","pic" : "$picc", "detail": "$detail","section": "$catego", "pice": "$number", "price": "$price"}';
                              // get post delete put
                              Response response =
                                  await post(url, headers: headers, body: json);
                              int statusCode = response.statusCode;
                              Map<String, dynamic> temp =
                                  await jsonDecode(response.body);
                              // print(id);
                              print(temp);
                              print(response.body);
                              
                              Navigator.pop(context);
                              const color = Colors.green;
                              showpopup(context, 'เพิ่มสำเร็จ', color);
                              
                            }
                            //Navigator.pop(context);
                            // Navigator.pushReplacement(context,
                            // MaterialPageRoute(builder: (context) => ProductControl())
                            // );
                          } catch (e) {
                            //_showsnackbar(e.toString());
                            const color = Colors.red;
                              //print('sad');
                              showpopup(context, 'เพิ่มไม่สำเร็จ', color);
                          }

                          //Navigator.pop(context);
                        },
                        child: Text(
                          'เพิ่ม',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Category() {
    /*List<String> cate = [
      'สินค้าเเปรรูป',
      'สินค้าเกษตร',
      'สมุนไพรและสปา',
      'ผลิตภัณฑ์บำรุงผิว',
      'งานจักสาน',
      'ของที่ระลึก'
    ];*/
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    listTile(x: 'สินค้าเเปรรูป'),
                    listTile(x: 'สินค้าเกษตร'),
                    listTile(x: 'สมุนไพรและสปา'),
                    listTile(x: 'ผลิตภัณฑ์บำรุงผิว'),
                    listTile(x: 'งานจักสาน'),
                    listTile(x: 'ของที่ระลึก'),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ],
          );
        });
  }

  ListTile listTile({String x}) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              border: Border.all(color: Colors.grey, width: 1.5)),
          padding: EdgeInsets.only(top: 10),
          child: Text(
            x,
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: () => selectitem(x),
    );
  }

  void selectitem(String category) {
    Navigator.pop(context);
    setState(() {
      selectcategory = category;
      catego = selectcategory;
    });
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
        context, MaterialPageRoute(builder: (context) => StatefulAddGoods1()));
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

/* Container(
                height: size.height * 0.2,
                width: size.width,
                child: Stack(
                  children: [
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
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kDefaultPadding),
                          height: 300,
                          width: 100,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.black,
                              size: 32,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: kDefaultPadding * 2.5,
                              left: kDefaultPadding * 1.5,
                              right: kDefaultPadding),
                          height: size.height,
                          child: Text(
                            'เพิ่มสินค้า',
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),*/
