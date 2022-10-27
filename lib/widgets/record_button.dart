import 'package:explore/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

typedef RecordCallback = void Function(String);

class RecordButton extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const RecordButton({
    required this.recordingFinishedCallback,
   // required this.icon,
   // this.color,
  
  });

  final RecordCallback recordingFinishedCallback;
   

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
   bool _isRecording = false;
  final _audioRecorder = Record();

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
        });
      }
    } catch (e) {
      print(e);
    }
  }

    
  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    widget.recordingFinishedCallback(path!);

    setState(() => _isRecording = false);
  }
    




  @override
  Widget build(BuildContext context) {
      /* final IconData icon;
      late final Color? color; */
      
  /* 
     if(_isRecording){
      return  GestureDetector(
         onTap: () {
        _isRecording ? _stop() : _start();
         },
        child: Icon(
        CupertinoIcons.stop_circle,
        color:AppColors.accent.withOpacity(0.3),
      
        ),
      );
    } else{
      return GestureDetector(
       onTap: () {
        _isRecording ? _stop() : _start();
       },
      child: const  Icon(
          CupertinoIcons.mic,
        color: Colors.white,
      ),
    );
    } */

        
  /*   return GestureDetector(
      onTap: () {
        _isRecording ? _stop() : _start();
      },
      child: Icon(
        icon,
        color:color,
      ),
    );  */


     final color =  _isRecording ? AppColors.accent.withOpacity(0.3) : AppColors.textFaded;
     final icon =  _isRecording ?  CupertinoIcons.stop_circle :   CupertinoIcons.mic;
   
     return GestureDetector(
      onTap: () {
        _isRecording ? _stop() : _start();
      },
      child: Icon(
        icon,
        color:color,
      ),
    );  
    } 
  }
