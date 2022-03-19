
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_alarm_clock/menu_info.dart';
import 'package:smart_alarm_clock/menu_info.dart';
import 'package:smart_alarm_clock/menu_info.dart';
import 'package:smart_alarm_clock/menu_info.dart';
import 'clock_view.dart';
import 'package:intl/intl.dart';
import 'package:smart_alarm_clock/clock_view.dart';
import 'package:smart_alarm_clock/constants/theme_data.dart';
import 'data.dart';
import 'menu_info.dart';
import 'package:smart_alarm_clock/menu_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE:d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),

          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 54),
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    //SizedBox(height: 32,),
                    Flexible(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedTime,
                              style:
                              TextStyle(color: Colors.white, fontSize: 65),
                            ),
                            Text(
                              formattedDate,
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ]),
                    ),

                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: ClockVirw(size:250,))),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        'TimeZone',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        Text(
                          'UTC' + offsetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildMenuButton(MenuInfo currentMenuInfo ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        color:currentMenuInfo.title =='Clock'? Colors.redAccent:Colors.transparent,
        onPressed: () {
          var menuInfo=Provider.of<MenuInfo>(context);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          children: [
            Image.asset(currentMenuInfo.imageSource, scale: 3.0),
            SizedBox(
              height: 16,
            ),
            Text(
              'Clock ''Alarm',
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
