import 'dart:io';
import 'package:explore/theme.dart';
import 'package:explore/widgets/actions_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const VideoViewScreen({required this.path});

  final String path;

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.file(File(widget.path))
    ..initialize().then((_){
      setState(() {
        
      });
    });
    super.initState();
  }


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
            child: _controller.value.isInitialized // initialized
            ? AspectRatio(
                aspectRatio : _controller.value.aspectRatio,
                child:VideoPlayer(_controller),
            )
             :Container(),
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
              style:const TextStyle(
                  fontSize:17,
                 // color:AppColors.textFaded,
                ),
                maxLines: 6,
                minLines: 1,
              decoration:const InputDecoration(
                border:InputBorder.none,
                hintText:'Add Caption ......',
                prefixIcon:Padding(
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
                hintStyle:TextStyle(
                  fontSize:19,
                  color:AppColors.textFaded,
                ),
                suffixIcon: CircleAvatar(
                  radius: 27,
                  backgroundColor: AppColors.accent,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 27,
                  ),
                )
              )
            )
            )
            ),

            Align(
              alignment:Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller.value.isPlaying 
                    ? _controller.pause()
                    : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.black38,
                  child: Icon(_controller.value.isPlaying ? Icons.pause
                  : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}