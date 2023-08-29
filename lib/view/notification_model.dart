import 'package:flutter/material.dart';

class NotificationModel {
  final IconData iconData;
  final String message;
  final DateTime date;

  NotificationModel({
    required this.iconData,
    required this.message,
    required this.date,
  });
}
