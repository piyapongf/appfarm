
import 'bodyseller.dart';
import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/material.dart';

class StatefulHomeSeller extends StatefulWidget {
  String name;
  @override
  _StatefulHomeSellerState createState() => _StatefulHomeSellerState(name);
}

class _StatefulHomeSellerState extends State<StatefulHomeSeller> {

  String detail;
  String name;
  String number;
  String pic;

  _StatefulHomeSellerState(String name);


  @override
  Widget build(BuildContext context) {
    print(name);
    return SafeArea(
          child: Scaffold(
          //appBar: AppBar(),
          backgroundColor: kBackgroundColor,
          body: BodySeller() 
          ),
    );
  }
}
