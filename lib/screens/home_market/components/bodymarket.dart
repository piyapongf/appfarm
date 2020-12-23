import 'package:MyApp_Seller/screens/Contract/New_contact_page.dart';
import 'package:MyApp_Seller/screens/home_market/components/headermarket.dart';
import 'package:MyApp_Seller/screens/screendetailaboutmarket/detailmarket.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

/*
class Bodyscreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderMarket(size: size),
        Marketbar(),
        Marketcard(),
        Marketbar_(),
        Marketcard_(),
      ],
    );
  }
}*/

class Bodyscreen extends StatefulWidget {
  @override
  _BodyscreenState createState() => _BodyscreenState();
}

class _BodyscreenState extends State<Bodyscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        HeaderMarket(size: size),
        Container(
          height: size.height * 0.71,
          child: ListView(
            children: [
              Marketbar(),
              Marketcard(),
              Marketbar_(),
              Marketcard_(),
            ],
          ),
        )
      ],
    );
  }
}

class Marketbar extends StatefulWidget {
  @override
  _MarketbarState createState() => _MarketbarState();
}

class _MarketbarState extends State<Marketbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: kDefaultPadding),
              child: Text(
                "ความต้องการของสินค้า",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold)
                    .copyWith(fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "เพิ่มเติม",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Marketcard extends StatefulWidget {
  @override
  _MarketcardState createState() => _MarketcardState();
}

class _MarketcardState extends State<Marketcard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 8,
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                //child: Image(image: null), ใสงรูป
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    AutoSizeText('Name',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Container(
                                      width: 170,
                                      child: AutoSizeText(
                                        'detail',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              //color: Colors.black,
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailMarket()));
                                      },
                                      child: const Text('เพิ่มเติม',
                                          style: TextStyle(fontSize: 15)),
                                      color: Color(0xFFFFF9C4),
                                      textColor: Colors.black,
                                      elevation: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class Marketbar_ extends StatefulWidget {
  @override
  _Marketbar_State createState() => _Marketbar_State();
}

class _Marketbar_State extends State<Marketbar_> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: kDefaultPadding),
              child: Text(
                "แนวโน้มการตลาด",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold)
                    .copyWith(fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "เพิ่มเติม",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Marketcard_ extends StatefulWidget {
  @override
  _Marketcard_State createState() => _Marketcard_State();
}

class _Marketcard_State extends State<Marketcard_> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Center(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
