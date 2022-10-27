import 'dart:io';
import 'package:flutter/material.dart';
import 'package:explore/theme.dart';

class OwnImageTile extends StatelessWidget {
const OwnImageTile//({Key? key}) : super(key: key);
 ({
  required this.path,
  required this.message,
  required this.time,
  });

 final String path;
 final String message;
 final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
            color: AppColors.accent
          ),
           child:Card(
            margin: const EdgeInsets.all(3),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Expanded(
                   child: 
                   Image.file(
                    File(path),
                    fit: BoxFit.fitHeight,
                   )
                 ),  
                 message.length > 0 ?
                  Column(
                    children: [
                      Container(
                        height:40,
                        padding: const EdgeInsets.only(
                          left:15,
                          top:8,          
                           ),
                        child: Text(message,
                         overflow: TextOverflow.ellipsis,
                           style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                        ),
                       ),
                 ),
                     Align(
                      alignment: Alignment.centerRight,
                       child: Container(
                        height: 10,
                         padding: const EdgeInsets.only(
                          top:8,
                          right:5,          
                           ),
                         child: Text(
                              time, 
                               style: const TextStyle(
                                 fontSize: 10,
                                 fontWeight: FontWeight.w600,
                               ),
                         ),
                       ),
                     )
                    ],
                  ): Container(),
               ],
             )
/* 
              Text(
                          time, 
                           style: const TextStyle(
                             color: AppColors.textFaded,
                             fontSize: 10,
                             fontWeight: FontWeight.bold,
                           ),
                         ),  */
           )
        ),
      ),
    );
  }
}