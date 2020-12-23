import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/material.dart';

import 'Body.dart';

class StatefulAddGoods extends StatefulWidget {
  @override
  _StatefulAddGoodsState createState() => _StatefulAddGoodsState();
}

class _StatefulAddGoodsState extends State<StatefulAddGoods> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor:  kBackgroundColor,
        
        body: Body(),
        
      ),
    );
  }
}