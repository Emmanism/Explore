import 'package:explore/helpers.dart';
import 'package:explore/models/chat_model.dart';
import 'package:explore/models/message_data.dart';
import 'package:explore/models/message_model.dart';
import 'package:explore/screens/chats_screen.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:explore/widgets/build_last_message.dart';
import 'package:explore/widgets/build_last_message_at.dart';
import 'package:explore/widgets/unread_indicator.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const RecentChats({
    required this.chatModel,
    required this.sourchat,
    required this.chatmodels,
   // required this.messageModel
    //required this.channel,

  });

  final ChatModel chatModel;
  final ChatModel sourchat;
   final List<ChatModel> chatmodels;
  // final MessageModel messageModel;
   

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
   // final List<MessageModel> messages = [];

  //final Channel channel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      /*  Navigator.of(context).push(
          ChatsScreen.routeWithChannel(channel) */
           Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (_)=> ChatsScreen(
                sourchat: widget.sourchat,
                chatModel: widget.chatModel,
                chatmodels:widget.chatmodels,
               // messageModel: widget.messageModel,
                )));
      },
      child: Container(
        height:100,
        margin:const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width:0.2,
              )
            )
          ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
             const Padding(
                padding: const EdgeInsets.all(10.0),
                child:   Avatar.medium(),       
              ),
    
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical:8.0,
                        ),
                      child: Text(widget.chatModel.name,
                     // Helpers.getChannelName(channel, context.currentUser!),
                       overflow: TextOverflow.ellipsis,
                      style: const TextStyle(          
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        wordSpacing: 1.5,
    
                      ),
                      ),
                    ),
                   SizedBox(
                      height: 20,
                      child: BuildLastMessage(
                      //  channel: channel,
                      chatModel: widget.chatModel,
                     // messageModel: widget.messageModel,
                      // message: messages[index].message,
                      ), 

                      ),
                  ],
                )
                ),
    
                 Padding(
                   padding: const EdgeInsets.only(
                    right: 20.0,
                   ),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(height: 4.0),
                    BuildLastMessageAt(
                      // channel: channel,
                      chatModel: widget.chatModel,
                     // messageModel: widget.messageModel,
                   ), 
                      const SizedBox(
                        height: 8,
                      ),
    
                     const Center(
                      child: UnreadIndicator(),
                      ), 
                    ]
                ),
                 )
            ],
    
          ),
        ),
      ),
    );
  }
}
