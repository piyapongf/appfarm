import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/material.dart';

class ButtonEdit extends StatefulWidget {
  final Size size;

  const ButtonEdit({Key key, this.size}) : super(key: key);
  @override
  _ButtonEditState createState() =>
      _ButtonEditState(size);
}

class _ButtonEditState extends State<ButtonEdit> {
  final Size size;

  _ButtonEditState(this.size);


  @override
  Widget build(BuildContext context) {
    //print("name is $name");
    return SafeArea(
          child: Container(
        height: size.height * 0.1,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.1,
                  width: 206,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36), 
                        /*topRight: Radius.circular(36)*/),
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          /*topRight: Radius.circular(36)*/),
                    ),
                    onPressed: () {/*Edit detail*/Navigator.pop(context);},
                    child: Text(
                      'เพิ่ม',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: 205,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        /*topLeft: Radius.circular(36)*/
                        topRight: Radius.circular(36)),
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          /*topLeft: Radius.circular(36),*/
                          topRight: Radius.circular(36)),
                    ),
                    onPressed: () {Navigator.pop(context);},
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
