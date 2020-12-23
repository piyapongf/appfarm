import 'package:MyApp_Seller/constants.dart';
import 'package:MyApp_Seller/screens/home_market/components/home_market_screen.dart';
import 'package:MyApp_Seller/screens/home_seller/components/new_homeseller.dart';
import 'package:MyApp_Seller/screens/profile/new_profile.dart';
import 'package:MyApp_Seller/screens/profile/profile.dart';
import 'package:MyApp_Seller/screens/screen_map/map_add/component/screenmap.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';

import 'screens/Notififacation/notification.dart';

void main() {
  runApp(MyAppJa());
}

class MyAppJa extends StatefulWidget {
  @override
  _MyAppJaState createState() => _MyAppJaState();
}

class _MyAppJaState extends State<MyAppJa> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: selectpage(currentTabIndex),
        bottomNavigationBar: _mybar(),
      ),
      //MapScreen(),//MarketScreen(),
    );
  }

  Widget selectpage(int index) // <------- ตัวเลือก page
  {
    switch (index) {
      case 0:
        return StatefulHomeSeller1();  // <----เรียกใช้ ไฟล์ HomePage
        break;
      case 1:
        return MarketScreen();//TestPage();
        
        break;
      case 2:
      return NotificationPage();//NewInfoPageBuyer();
       /* return //NewInfoPageSeller();
        Center(
          child: Text('There is no page builder for this index[$index].'));*/
        //Center(child: Text('There is no page builder for this index[$index].'),);
        break;
      case 3:
      return StatefulProfile();
      return Center(
          child: Text('There is no page builder for this index[$index].'),
        );//YoutubePlayerDemoApp();//VideoApp();//
     /* Center(
          child: Text('There is no page builder for this index[$index].'));*/
        break;

      default:
        return //YoutubePlayerDemoApp();
         Center(
          child: Text('There is no page builder for this index[$index].'),
        );
        break;
    }
  }

//ส่วนของ bar
  Widget _mybar() {
    return CircleBottomNavigation(
          circleColor:kPrimaryColor,
          activeIconColor:Colors.black,
          textColor:Colors.black,
          inactiveIconColor:Colors.black,
    
              initialSelection: currentTabIndex,
              tabs: [
                TabData(icon: Icons.home, title: "หน้าหลัก"),
                TabData(icon: Icons.trending_up_outlined, title: "โปรโมชั่น"),
                TabData(icon: Icons.notifications_active, title: "แจ้งเตือน"),
                TabData(icon: Icons.settings, title: "การตั้งค่า"),
              ],
              onTabChangedListener: (position) {
                setState(() {
                  currentTabIndex = position;
                });
              },
            );
      }
}
