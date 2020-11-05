import 'package:flutter/material.dart';

@immutable
class Msg {
  final String title;
  final String body;

  const Msg({
    @required this.title,
    @required this.body,
  });
}
