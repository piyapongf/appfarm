import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';



class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        height: size.height * 0.2,
        child: Stack(
          children: [
            Container(
              height: size.height,
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
                      color:   Colors.black,
                      size: 32,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: kDefaultPadding*2.5,
                  left: kDefaultPadding*1.5,
                  right: kDefaultPadding),
                  height: size.height,
                  child: Text(
                    'แก้ไขข้อมูล',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}