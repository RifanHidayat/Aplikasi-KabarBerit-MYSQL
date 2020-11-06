import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:kabarnagari/ui/OnBoardingScreen.dart';

class SplassScreen extends StatefulWidget {
  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  void initState(){
    startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      SpinKitFoldingCube(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ],
                  ),

                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),

                  ],
                ),
              )

            ],
          )
        ],

      ),


    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>OnBoardingScreen()
    ));
  }

}
