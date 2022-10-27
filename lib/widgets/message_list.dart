/* 
import 'package:explore/widgets/date_lable.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MessageList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MessageList // ({required this.messages});
  ({Key? key}) : super(key: key);

 // final List<Message> messages;

  @override
  Widget build(BuildContext context) {
     return ListView.separated(
        itemCount: messages.length + 1,
        reverse: true,
        separatorBuilder: (context, index) {
          if (index == messages.length - 1) {
            return DateLable(dateTime: messages[index].createdAt);
          }
          if (messages.length == 1) {
            return const SizedBox.shrink();
          } else if (index >= messages.length - 1) {
            return const SizedBox.shrink();
          } else if (index <= messages.length) {
            final message = messages[index];
            final nextMessage = messages[index + 1];
            if (!Jiffy(message.createdAt.toLocal())
                .isSame(nextMessage.createdAt.toLocal(), Units.DAY)) {
              return DateLable(dateTime: messages[index].createdAt);
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const SizedBox.shrink();
          }
        },
        itemBuilder: (context, index) {
          if(index < messages.length){
            final message = messages[index];
            if (message.user?.id == context.currentUser?.id){
              return MessageOwnTile(
                message: message,
                 );
            } else{
               return MessageTile(
              message: message
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
        
        );
        
   
  return Text('');


  }
}
 */