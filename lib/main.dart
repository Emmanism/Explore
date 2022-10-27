// @dart=2.9
import 'package:camera/camera.dart';
import 'package:explore/app.dart';
import 'package:explore/screens/camera_screen.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';



Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();

   cameras = await availableCameras();

  // final client = StreamChatClient(streamKey);

  runApp(
     MyApp(
      // client: client,
       appTheme: AppTheme(),
     ),
    );
}

