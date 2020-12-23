import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../constants.dart';
import 'appbar.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: buildAppBar(), 
        backgroundColor: kBackgroundColor, body: SingleChildScrollView(child: Appbar_()));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(''),
    );
  }
}
