import 'package:flutter/material.dart';

import '../../../../constants.dart';



class Textmygoods extends StatelessWidget {
  const Textmygoods({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        height: size.height*0.1,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding * 5,
              left: kDefaultPadding,),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
