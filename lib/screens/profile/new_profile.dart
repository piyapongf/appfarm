import 'dart:async';

import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/main.dart';
import 'package:flutter/material.dart';

class StatefulProfile extends StatefulWidget {
  @override
  _StatefulProfileState createState() => _StatefulProfileState();
}

class _StatefulProfileState extends State<StatefulProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String picprofile = 'assets/images/1.jpeg';

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Container(
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
                    Container(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding * 5,
                        //right: kDefaultPadding
                      ),
                      height: size.height,
                      width: size.width,
                      child: Text(
                        'ข้อมูลส่วนตัว',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),

              //body
              RefreshIndicator(
                  onRefresh: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (a, b, c) => DelayPage(),
                            transitionDuration: Duration(seconds: 10)));
                    return Future.value(false);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        width: size.width,
                        height: size.height * 0.68,
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                //pic
                                Container(
                                  width: size.width*0.4,
                                  height: size.height*0.2 ,
                                  child: Center(
                                    child: Container(
                                        height: 120,
                                        width: 120,
                                        margin: EdgeInsets.only(
                                            left: size.width*0.2*0.3, top: 30, right: 20),
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
                                              image: AssetImage(picprofile)),
                                        )),
                                  ),
                                ),

                                Spacer(),

                                //name
                                Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.5,
                                  //margin: EdgeInsets.all(kDefaultPadding),
                                  child: Column(
                                    children: [
                                      Container(
                                        //color: Colors.white,
                                        width: size.width,
                                        height: size.height * 0.1,
                                        margin: EdgeInsets.only(top: 40),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 10),
                                                  blurRadius: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: -5),
                                            ]),
                                        child: Text(
                                          'Guests',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            //button edit profile
                            Container(
                              height: size.height * 0.15,
                              width: size.width,
                              //color: Colors.black,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(
                                  top: kDefaultPadding,
                                  //right: kDefaultPadding,
                                  //left: kDefaultPadding,
                                  bottom: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    //border: Border.all(color: Colors.grey, width: 1.5)
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: -5),
                                    ]),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'แก้ไขโปรไฟล์',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),

                            //button change to buyyer
                            Container(
                              height: size.height * 0.15,
                              width: size.width,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(
                                  top: 0,
                                  //right: kDefaultPadding,
                                  //left: kDefaultPadding,
                                  bottom: kDefaultPadding * 0.4),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    //border: Border.all(color: Colors.grey, width: 1.5)
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: -5),
                                    ]),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'เปลี่ยนเป็นผู้ซื้อ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(kDefaultPadding),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5)),
                              ),
                            ),

                            //button logout
                            Container(
                              height: size.height * 0.15,
                              width: size.width,
                              //color: Colors.black,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(
                                  top: 0,
                                  //right: kDefaultPadding,
                                  //left: kDefaultPadding,
                                  bottom: kDefaultPadding * 0.4),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    //border: Border.all(color: Colors.grey, width: 1.5)
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: -5),
                                    ]),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'ออกจากระบบ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
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
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyAppJa())); //กลับไปหน้าหลัก
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
