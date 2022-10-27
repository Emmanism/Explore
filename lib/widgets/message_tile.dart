import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
// ignore: use_key_in_widget_constructors
  const MessageTile ({
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
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration:  BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius:const  BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 12.0,
                ),
                child: Text(message,
                 // message.text ?? '', // can also be message.text!(which means message is nit equal to null).
/*                   style:   const TextStyle(
                    color: AppColors.textFaded,
                  ), */
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top:8.0,
                left: 10.0,

                ),
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