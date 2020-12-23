import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class HeaderMarket extends StatelessWidget {
  const HeaderMarket({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            height: size.height,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 19),
                      blurRadius: 30,
                      color: Colors.black.withOpacity((0.1)))
                ]),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                height: 300,
                width: 100,
                
              ),
              Container(
                padding: EdgeInsets.only(top: kDefaultPadding*2.5,
                left: kDefaultPadding*1.5,
                right: kDefaultPadding),
                height: size.height,
                child: Text(
                  'การตลาด',
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
