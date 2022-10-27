/* 
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DateLable extends StatefulWidget {
// ignore: use_key_in_widget_constructors
  const DateLable({required this.dateTime});

//final String lable;
  final DateTime dateTime;

  @override
  State<DateLable> createState() => _DateLableState();
}

class _DateLableState extends State<DateLable> {
  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy(widget.dateTime);
    final now = DateTime.now();

    if (Jiffy(createdAt).isSame(now, Units.DAY)) {
      dayInfo = 'TODAY';
    } else if (Jiffy(createdAt)
        .isSame(now.subtract(const Duration(days: 1)), Units.DAY)) {
      dayInfo = 'YESTERDAY';
    } else if (Jiffy(createdAt)
        .isAfter(now.subtract(const Duration(days: 7)), Units.DAY)) {
      dayInfo = createdAt.EEEE;
    } else if (Jiffy(createdAt)
        .isAfter(Jiffy(now).subtract(years: 1), Units.DAY)) {
      dayInfo = createdAt.MMMd;
    } else {
      dayInfo = createdAt.MMMd;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: Text(
              dayInfo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 */
