import 'package:MyApp_Seller/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

//งงมากทำไม Text ถึงมีเส้นใต้สองเส้นเฉย

class DetailMarket extends StatefulWidget {
  @override
  _DetailMarketState createState() => _DetailMarketState();
}

class _DetailMarketState extends State<DetailMarket> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Container(
        height: size.height,
        color: kBackgroundColor,
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(20, 10),
                        blurRadius: 20,
                        color: Colors.black,
                        spreadRadius: -20)
                  ]),
              child: Row(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          height: 100,
                          width: 80,
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
                      ),
                    ],
                  ),
                  Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/2.JPG')),
                      )),
                ],
              ),
            ),
            Container(
              height: size.height * 0.46,
              width: size.width,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: AutoSizeText('ชื่อบริษัท',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: AutoSizeText('รายละเอียด :',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: AutoSizeText(
                            'รายละเอียดเกี่ยวกับสิ่งที่ต้องการที่อยุ่ในการรับสินค้าต่างๆ แล้วแต่ใจป้อนลงไปในส่วนนี้ สามารถรับข้อความยาวได้ถึง 10 บรรทัดเลยทีเดียว',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            maxLines: 10,
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: AutoSizeText('ปริมาณที่ต้องการ :',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: AutoSizeText('500 กิโลกรัม',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            maxLines: 10,
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: AutoSizeText('กำหนดส่งมอบ :',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: AutoSizeText('31 ธ.ค 61',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            maxLines: 10,
                            textAlign: TextAlign.left),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              child: Row(
                children: [
                  Container(
                    width: 160,
                  ),
                  Container(
                    height: size.height * 0.1,
                    padding: EdgeInsets.only(left: 0),
                    width: 250,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-8, -12),
                              blurRadius: 20,
                              color: Colors.black,
                              spreadRadius: -25)
                        ]),
                    child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          ),
                    ),
                    onPressed: () {
                      //เชื่อมไปหน้า Contract ของอามทำเเล้วไม่ได้ TT
                    },
                    child: Text(
                      'ติดต่อซื้อขาย',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
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
