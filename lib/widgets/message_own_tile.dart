
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';


class MessageOwnTile extends StatelessWidget {
// ignore: use_key_in_widget_constructors
  const MessageOwnTile ({
    required this.message,
    required this.time,
    }); 
  
  final String message;
  final String time;

 // final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    bottomLeft: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                child: Text(message,
                 // message.text ?? '',
                  style: const TextStyle(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
