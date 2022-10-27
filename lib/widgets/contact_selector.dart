import 'package:explore/models/chat_model.dart';
import 'package:explore/models/message_model.dart';
import 'package:explore/screens/chats_screen.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ContactSelector extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ContactSelector({
   // required this.user,
   required this.chatmodels,
   required this.sourchat,
   required this.chatModel,
  // required this.messageModel,
  });
 // final User user;
   final List<ChatModel> chatmodels;
  final ChatModel sourchat;
  final ChatModel chatModel;
 // final MessageModel messageModel;
/* 
  Future<void> createChannel(BuildContext context) async{
    final core = StreamChatCore.of(context);
    final channel = core.client.channel(
      'messaging',extraData: {
        'members':[
          core.currentUser!.id,
          user.id,
        ]
      }
    );

    await channel.watch();
    // ignore: use_build_context_synchronously
   // Navigator.of(context).push(ChatsScreen.routeWithChannel(channel));
    Navigator.of(context).push(ChatsScreen.route);
  } */

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
       // createChannel(context);
        // Navigator.of(context).push(ChatsScreen.route);
         Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (_)=> ChatsScreen(
                sourchat: sourchat,
                 chatModel: chatModel,
                 chatmodels:chatmodels,
               //  messageModel: messageModel,
                )));
      },
            child: ListTile(  
              leading: Avatar.small(
               // url: user.image,
         ),
           title:Text(chatModel.name),
      ),
    );
  }
}