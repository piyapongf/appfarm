import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/screens/add_goods/components/%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B9%80%E0%B9%80%E0%B8%A5%E0%B9%89%E0%B8%A7/adddetail.dart';
import 'package:flutter/material.dart';

import 'Header.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(size: size),
            AddDetail(size: size)
          ],
        ),
      ),
    );
  }
}


