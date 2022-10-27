import 'dart:io';
import 'package:explore/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore/widgets/actions_button.dart';


class CameraViewScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const  CameraViewScreen({
    required this.path,
    required this.onImageSend,
    });

  final String path;
  final Function onImageSend;
  static TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        leadingWidth: 45,
        leading: Align(
            alignment: Alignment.centerRight,
            child: ActionsButton(
              icon:CupertinoIcons.back,
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),

          actions:<Widget>[
            IconButton(
              icon:const Icon(
                Icons.crop_rotate,
                size:27,
              ),
              onPressed:(){},
            ),
            IconButton(
              icon:const Icon(
                Icons.emoji_emotions_outlined,
                size:27,
              ),
              onPressed:(){},
            ),
            IconButton(
              icon:const Icon(
                Icons.title,
                size:27,
              ),
              onPressed:(){},
            ),
            IconButton(
              icon:const Icon(
                Icons.edit,
                size:27,
              ),
              onPressed:(){},
            )
          ]

      ),

      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children:<Widget>[
            // ignore: sized_box_for_whitespace
            Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
            ),
            ),
            Positioned(
            bottom:0,
            child:Container(
            color:Colors.black,
            width:MediaQuery.of(context).size.width,
            padding:const EdgeInsets.symmetric(
              vertical:5,
              horizontal:8
            ),
            child:TextFormField(
              controller: _controller,
              style:const TextStyle(
                  fontSize:17,
                  color:Colors.white,
                ),
                maxLines: 6,
                minLines: 1,
              decoration: InputDecoration(
                border:InputBorder.none,
                hintText:'Add Caption ......',
                prefixIcon:const Padding(
                  padding: EdgeInsets.only(
                    bottom:8.0,
                  ),
                  child: Icon(
                    Icons.add_photo_alternate,
                    color:AppColors.textFaded,
                    size:25,
                    // color
                  ),
                ),
                hintStyle:const TextStyle(
                  fontSize:19,
                  color: AppColors.textFaded,
                  // color
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    onImageSend(
                      path,
                      _controller.text.trim(),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 27,
                    backgroundColor: AppColors.accent,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                )
              )
            )
            )
            )
          ]
        ),
      ),
    );
  }
}