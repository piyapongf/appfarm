import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class WelcomeAndProfile extends StatelessWidget {
  const WelcomeAndProfile({
    Key key,
    @required this.size,
    this.picprofile
  }) : super(key: key);

  final Size size;
  final String picprofile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        //margin: EdgeInsets.only(bottom: kDefaultPadding * 1.5),
        //It cover 30% of total height
        height: size.height * 0.3,
        child: Stack(
          children: [
            Container(
              height: size.height,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 19),
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.1))
                  ]),
            ),
            Row(children: [
              Container(
                padding: EdgeInsets.only(
                    top: kDefaultPadding + 50, left: kDefaultPadding + 20),
                height: size.height,
                //width: size.width,
                child: Text('ยินดีต้อนรับ',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(),
              Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 40, top: 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: -5)
                    ],
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(picprofile)),
                  )),
              //chage according data
            ]),
            Container(
                //crossAxisAlignment: CrossAxisAlignment.start,
                padding: EdgeInsets.only(
                    top: kDefaultPadding + 95, left: kDefaultPadding + 60),
                height: size.height,
                width: size.width * 0.65,
                child: AutoSizeText(
                  'กลุ่มแม่บ้านพัฒนาตนเอง',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
