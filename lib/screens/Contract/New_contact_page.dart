import 'package:flutter/material.dart';



class NewContactPage extends StatefulWidget {
  String title = 'NoneTitle',
      head = 'NoneHead',
      subhead = 'NoneSubhead',
      mypicpath ='';//= 'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png'; //'images/mypic2.png';
  bool extraData = false;
  List<dynamic> metricData = null;
  Color myBackgroundcolor;
  NewContactPage(this.extraData,
      {@required this.title = 'Flutter Demo[ContactPage]',
      this.head = 'ติดต่อซื้อ-ขาย',
      this.subhead,
      this.mypicpath = 'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png',
      this.metricData,
      });
  //Name construct

  @override
  State<StatefulWidget> createState() {
    if (!extraData) {
      return _ContactPage(title, head);
    } else {
      print('cmypicpath$mypicpath');
      return _ContactPage(title, head,
          mypicpath: mypicpath, subHead: subhead, metricData: metricData);
    }
  }
}

/*
_myitemInrow(icon: Icons.phone, ask: 'โทร', data: '055-968605'),
_myitemInrow(icon: Icons.phone_android, ask: 'มือถือ', data: '081-9997905'),
_myitemInrow(icon: Icons.email, ask: 'E-mail', data: 'bps2018@hotmail.com'),
_myitemInrow(icon: Icons.contacts, ask: 'Line', data: '@bps2018'),
 */
List<dynamic> standartData() {
  var sdArray = [];

  var dArray1 = [];
  dArray1.add(Icons.phone);
  dArray1.add('โทร');
  dArray1.add('055-968605');
  var dArray2 = [];
  dArray2.add(Icons.phone_android);
  dArray2.add('มือถือ');
  dArray2.add('081-9997905');
  var dArray3 = [];
  dArray3.add(Icons.email);
  dArray3.add('E-mail');
  dArray3.add('bps2018@hotmail.com');
  var dArray4 = [];
  dArray4.add(Icons.contacts);
  dArray4.add('Line');
  dArray4.add('@bps2018');

  sdArray.add(dArray1);
  sdArray.add(dArray2);
  sdArray.add(dArray3);
  sdArray.add(dArray4);

  return sdArray;
  //print(sdArray.runtimeType);
  //print(sdArray[0]);
}

class _ContactPage extends State<NewContactPage> {
  String head = '', title = '', mypicpath = 'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png', subHead = 'Mysubhead';
  Color myBgcolor = Color.fromRGBO(222, 184, 135, 1.00);
  List<dynamic> metricData = standartData();

  _ContactPage(String title, String head,
      {String mypicpath, // <---- ถาพ cartoon ถ้าไม่ได้ บอกมา
      String subHead,
      List<dynamic> metricData,
      Color myBgcolor}) {
    this.head = head;
    this.title = title;
      print('myBgcolor is $myBgcolor');
    if (mypicpath != null) {
      this.mypicpath = mypicpath;
    }
    if (subHead != null) {
      this.subHead = subHead;
    }
    if (metricData != null) {
      this.metricData = metricData;
    }
    if (myBgcolor != null)
    {
      print('change');
      this.myBgcolor = myBgcolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
/*
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
*/
      home: Container(child: _mybody()
          //bottomNavigationBar: null,
          ),
    );
  }

  Widget _mybody() {
    //myBgcolor = Colors.red;
    return Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              color: myBgcolor), //----------- สีพื้นหลัง
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              head,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            //backgroundColor: Color.fromRGBO(139, 69, 19,1.0), //--------------------------  สี แถบด้านบน
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              _mycard()
            ]), // ติดปัญหา ตรงการ จองที่
          ),
        ),
/*
        SingleChildScrollView(
          child: Column(
              children: <Widget>[_mycard()]), // ติดปัญหา ตรงการ จองที่
        )*/
      ],
    );
  }

  Widget _mycard() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5, // เงา
      margin: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        //color: Colors.black,
        margin: EdgeInsets.all(25),
        child: Column(children: <Widget>[
          //SizedBox(height: 20, width: 5),
          Container(
            margin: EdgeInsets.all(10),
            height: 150,
            width: 250,
            decoration: new BoxDecoration(
              /*boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  //spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],*/
              //บอกเส้นขอบ
     /*           border: Border.all(
                width: 1,
              ),
*/
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //shape: BoxShape.rectangle ,//BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  /*image:
                    AssetImage(mypicpath), //<-----------------  เปลี่ยนภาพหน้าปก
*/
                  image: new NetworkImage(mypicpath)),
            ),
          ), //ใช้สำหรับจำกัดขอบเขตภาพ

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 9.0),
            margin: EdgeInsets.all(3),
            //color: Colors.grey.shade700,
            child: Text(subHead,
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center),
          ), // <----- ขยายเส้นกั้นให้ ใหญ่ขึ้น

          Container(
            //elevation: 5, // เงา
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                //_myitemInrow(icon: Icons.phone, ask: 'โทร', data: '055-968605'),

                _myitemInrow(
                    icon: metricData[0][0],
                    ask: metricData[0][1],
                    data: metricData[0][2]),
                _myitemInrow(
                    icon: metricData[1][0],
                    ask: metricData[1][1],
                    data: metricData[1][2]),
                _myitemInrow(
                    icon: metricData[2][0],
                    ask: metricData[2][1],
                    data: metricData[2][2]),
                _myitemInrow(
                    icon: metricData[3][0],
                    ask: metricData[3][1],
                    data: metricData[3][2]),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _myitemInrow({IconData icon, String ask, String data}) {
    return Wrap(
      children: [
        Row(
          children: [
            SizedBox(height: 1, width: 10),
            Icon(
              icon,
              size: 32,
            ),
            SizedBox(height: 1, width: 10),
            Flexible(
              child: Container(
                // <---- เปลี่ยนเป็น card
                //color: Colors.blueGrey,
                margin: EdgeInsets.symmetric(
                    vertical:
                        12.0), //<---------------- กำหนด ระยะห่างระหว่าง ช่อง
                //height: 35,
                //width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('$ask :  $data',
                            style: TextStyle(
                                height:
                                    1.6, //<--------------- ตัวกำหนด ความสูงตัวอักษร
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left
                            //,overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                    /*Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.0),
                      child: Container(
                          height: 1.2, width: 300.0, color: Colors.black),
                    ),*/
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
