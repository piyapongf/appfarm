import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Container(
        height: size.height * 0.37,
        margin: EdgeInsets.only(top: 200),
        //color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 2),
              padding: EdgeInsets.only(bottom: 20),
              width: size.width * 0.95,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF9C4),
                    borderRadius: BorderRadius.circular(50.0),
                    //border: Border.all(color: Colors.grey, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 8,
                          color: Colors.black.withOpacity((0.1)))
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 50),
                      width: size.width,
                      child: Text(
                        'ชื่อที่อยู่',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 8,
                                color: Colors.black.withOpacity((0.1))),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'ชื่อที่อยุ่',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            //เอาเส้นรอบ textfield ออกไม่ได้ 
                            borderSide: BorderSide(color: Colors.white,width: 20),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60))),
                        ),
                        onSubmitted: (String value) {},
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              padding: EdgeInsets.only(bottom: 20),
              width: size.width * 0.95,
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0),
                        //border: Border.all(color: Colors.grey, width: 1.5),
                        boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 8,
                          color: Colors.black.withOpacity((0.1)))
                    ]),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                    //color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "เพิ่มตำแหน่งสถานที่",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(fontSize: 20),
                    ),
                    color: Color(0xFFFFF9C4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
