import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading
{

void loading1(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

            content: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Loading...."),
                  SizedBox(height: 30,),
                  CircularProgressIndicator(
                    backgroundColor: Colors.blue[250],
                  ),
                ],
              ),

            )
        );
      }
  );
}}