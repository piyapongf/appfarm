import 'package:MyApp_Seller/screens/home_market/components/bodymarket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../constants.dart';



class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      //appBar: buildAppBar(),
      backgroundColor: kBackgroundColor,
      body: Bodyscreen(),
    );
  }

  /*AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text('การตลาด'),
    );
  }*/
}
