import 'package:MyApp_Seller/constants.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class StatefulEditGoods extends StatefulWidget {
  @override
  _StatefulEditGoodsState createState() => _StatefulEditGoodsState();
}

class _StatefulEditGoodsState extends State<StatefulEditGoods> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Body()
      ),
    );
  }
}