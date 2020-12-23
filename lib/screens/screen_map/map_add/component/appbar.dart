import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Button.dart';

class Appbar_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Column(
        children: [
          Container(
            height: size.height * 0.3,
            child: Stack(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(left: 10,),
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
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
                        width: size.width*0.5,
                        child: Text(
                          'แผนที่',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.amber.withOpacity(0.23),
                        )
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '     ค้นหา',
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                            size: 36.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 230),
          Button(),
        ],
      ),
    );
  }
}
