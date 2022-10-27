import 'dart:io';
import 'package:flutter/material.dart';
import 'package:explore/theme.dart';

class ImageTile extends StatelessWidget {
const ImageTile({
  required this.path,
  required this.message,
  required this.time,
});

final String path;
final String time;
final String message;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.accent,
          ),
           child:Card(
            margin: const EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                  'http://192.168.43.199:5000/uploads/$path',
                  fit: BoxFit.fitHeight
                  ),
                ),
                message.length > 0 ?
                  Container(
                    height:40,
                    padding: const EdgeInsets.only(
                      left:15,
                      right:8,          
                       ),
                    child: Text(message,
                     overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                    ),
                   ),
                 ): Container(),

          /*     Text(
               time, 
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
 */


              ],
            )
           ),
        ),
      ),
    );
  }
}