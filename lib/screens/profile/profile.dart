import 'package:MyApp_Seller/constants.dart';

import 'package:flutter/material.dart';

//import './constant.dart';



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
              color: kBackgroundColor), //----------- สีพื้นหลัง
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.2 - 20,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          )),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 35, bottom: 0),
                            child: Center(
                              child: Text(
                                'ตั้งค่า',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: kDefaultPadding),
                    child: CircleAvatar(
                      radius: 50.0,
                      //backgroundImage: AssetImage(''),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 0, top: 0),
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Guest',
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(left: 0, right: 0, top: 50),
                    elevation: 10,
                    child: GestureDetector(
                      onTap: () {
                        print('You press Me[Edit!!!]');
                      },
                      child: Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'แก้ไขโปรไฟล์',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(left: 0, right: 0, top: 50),
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'เปลี่ยนเป็นผู้ขาย',
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
