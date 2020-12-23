import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/screens/screen_map/map_add/component/screenmap.dart';
import 'package:flutter/material.dart';

class EditDetail extends StatefulWidget {
  final Size size;

  const EditDetail({Key key, this.size}) : super(key: key);

  @override
  _EditDetailState createState() => _EditDetailState(size);
}

class _EditDetailState extends State<EditDetail> {
  final Size size;
  String selectcategory = '';
  String name;
  String detail;
  String number;
  String catego;

  _EditDetailState(this.size);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        height: size.height * 0.8,
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: kDefaultPadding),
              //height: size.height * 0.8,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      height: 180,
                      width: 200,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            height: 180,
                            width: 150,
                            child: FlatButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(top: 80, left: 60),
                                      child: Icon(
                                        Icons.add_sharp,
                                        color: Colors.grey,
                                        size: 80,
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding * 0.4),
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
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
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
            Container(
              //Goods name
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'ชื่อสินค้า',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60)))),
                onSubmitted: (String value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                'รายละเอียด',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              //detail
              //height: 200,//decoration: BoxDecoration(color: Colors.black),
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'รายละเอียด',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36)))),
                onSubmitted: (String value) {
                  detail = value;
                },
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                'จำนวนสินค้า',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              //detail
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'จำนวนสินค้า',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60)))),
                onSubmitted: (String value) {
                  number = value;
                },
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                'หมวดหมู่',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
                height: 90,
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
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
                            Icons.edit_sharp,
                            size: 34,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                'ที่อยู่',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              //button add address
              padding: EdgeInsets.only(bottom: 20),
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.grey, width: 1.5)),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    onPressed: () {/*go to map page*/
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapScreen()),
                            );},
                    child: Text(
                      'เพิ่มตำแหน่ง',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFFFF9C4)),
              ),
            ),
            Container( //ขีดกั้นะหว่างปุ่มแก้ที่อยุ่กับปุ่มลบ
              padding: EdgeInsets.all(kDefaultPadding),
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.grey, width: 1.5)),
              ),
            ),
             Container( 
              //button delete goods
              padding: EdgeInsets.only(bottom: 20,top: 20),
              height: 110,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    border: Border.all(color: Colors.grey, width: 1.5)),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    onPressed: () {/*delete this goods*/Navigator.pop(context);},
                    child: Text(
                      'ลบสินค้านี้',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFFFF9C4)),
              ),
            ),
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
