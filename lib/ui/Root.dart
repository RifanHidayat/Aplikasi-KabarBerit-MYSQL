import 'package:flutter/material.dart';

import 'package:kabarnagari/ui/menu_page.dart';
import 'package:kabarnagari/ui/zoom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:kabarnagari/ui/HomeScreen.dart';




class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(

                child: HomeScreen()
            )),
      ),
    );
  }
}