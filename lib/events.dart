import 'package:flutter/foundation.dart';
import 'package:flutter_calender/main.dart';

class Event {
  final String title;

  Event({required this.title});

  @override
  String toString() => this.title;
}