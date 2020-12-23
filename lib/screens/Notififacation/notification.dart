import 'package:MyApp_Seller/screens/Notififacation/components/body.dart';
import 'package:flutter/material.dart';



//import 'package:flutter_search_bar/flutter_search_bar.dart';
//import 'New_contact_page.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage();
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    //size = MediaQuery.of(context).size;
    //size  = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo_NotificationPage',
      
      home: Scaffold(
        appBar: null,
        body: 
        // SafeArea(
        //   child: RefreshIndicator(
        //     onRefresh: () {
        //       Navigator.pushReplacement(
        //         context,
        //         PageRouteBuilder(
        //           pageBuilder: (a, b, c) => NotificationPage(),
        //           transitionDuration: Duration(seconds: 0),
        //         ),
        //       );
        //       return;
        //     },
        //     child: FutureBuilder<String>(
        //         future: _calculation,
        //         builder: (context, snapshot) {
        //           if (snapshot.data == null) {
        //             return LoadingPage();   
        //           } else {
        //             return Body();
        //           }
        //         }

        //         //child: Body()
        //         ),
        //   ),
        // ),
        
        SafeArea(child: Body()),
        bottomNavigationBar: null,
      ),
    );
  }

}
