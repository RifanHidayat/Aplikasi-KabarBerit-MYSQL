import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kabarnagari/model/message.dart';
import 'package:kabarnagari/ui/TambahDataScreen.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/model/data.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/sections/business.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/sections/politics.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/sections/science.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/sections/tech.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/sections/All.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final List<Msg> messages = [];

  PageController _controller = PageController(
    initialPage: 0,
  );

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {


          },
          child: Container(
            child: Image.asset("assets/images/menu.png"),
          ),
        ),
        title: Center(
          child: Text(
            "NEWS",
            style: TextStyle(
              fontFamily: "Sigmar",
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
            ),

          )
        ],
      ),

      floatingActionButton: new FloatingActionButton(
          child: new Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TambahDataScreen()));
          }),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        _controller.animateToPage(i,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        sections[i],
                        style: TextStyle(
                          color: currentPage == i
                              ? Colors.black
                              : Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: sections.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [
                  WorldSection(),
                  BusinessSection(),
                  PoliticsSection(),
                  TechSection(),
                  ScienceSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  showNotification(String title,String body) async {
    var android = new AndroidNotificationDetails('channel id', 'channel NAME', 'CHANNEL DESCRIPTION', priority: Priority.high,importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android,iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, '$title', '$body', platform, payload: 'Nitish Kumar Singh is part time Youtuber');
  }

  @override
  void initState() {

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Msg(
              title: notification['title'], body: notification['body']));
        });
        setState(() {
          showNotification(notification['title'], notification['body']);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Msg(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    super.initState();

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var androidd = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSs = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: androidd,iOS: iOSs);
    flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification);

    // TODO: implement initState
    super.initState();
  }
  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }
}