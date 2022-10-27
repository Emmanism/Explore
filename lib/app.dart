import 'package:explore/models/message_model.dart';
import 'package:explore/screens/camera_screen.dart';
import 'package:explore/screens/select_user_screen.dart';
import 'package:explore/services/theme_model.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
   MyApp({
   // required this.client,
    required this.appTheme,
    // required this.messageModel,
  });

  // This widget is the root of your application.
 // final StreamChatClient client;
  final AppTheme appTheme;
  // final MessageModel messageModel;
  


  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Explore',
        debugShowCheckedModeBanner: false,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.dark,
       /*  builder: (context, child){
          return StreamChat( // streamchatcore
            client: client,
            // ignore: deprecated_member_use
            child: ChannelsBloc(
              // ignore: deprecated_member_use
              child: UsersBloc(
                child: child!
                )
              ),
            ); //child won't be null because the child in the builder is optionally null
        }, */
        home:  const SelectUserScreen()
      );
  }
}
