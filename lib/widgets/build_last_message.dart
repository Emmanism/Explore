import 'package:explore/models/chat_model.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class BuildLastMessage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BuildLastMessage({
    // required this.channel,
    required this.chatModel,
   // required this.messageModel,
     // required this.message,
  });
  // final Channel channel;
  final ChatModel chatModel;
   // final String message;
  // final MessageModel messageModel;


  



  


  @override
  Widget build(BuildContext context) {
  /*   return BetterStreamBuilder<int>(
        stream: channel.state!.unreadCountStream,
        initialData: channel.state?.unreadCount ?? 0,
        builder: (context, count) {
          return BetterStreamBuilder<Message>(
              stream: channel.state!.lastMessageStream,
              initialData: channel.state!.lastMessage,
              builder: (context, lastMessage) {
                return Text(
                  lastMessage.text ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: (count > 0)
                      ? const TextStyle(fontSize: 12, color: AppColors.accent)
                      : const TextStyle(
                          fontSize: 12,
                          color: AppColors.textFaded,
                        ),
                );
              });
        }); */

        return Text (// messageModel.message,
                   chatModel.currentMessage,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                          fontSize: 12,
                          color: AppColors.textFaded,
                        )
        );

  }
}
