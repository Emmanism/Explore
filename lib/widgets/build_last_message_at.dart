import 'package:explore/models/chat_model.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class BuildLastMessageAt extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
 const   BuildLastMessageAt({
   // required this.channel
    required this.chatModel,
   // required this.messageModel,
  });

  // final Channel channel;
  final ChatModel chatModel;
  // final MessageModel messageModel;

 

  @override
  Widget build(BuildContext context) {
   /*  return BetterStreamBuilder<DateTime>(
      stream: channel.lastMessageAtStream,
      initialData: channel.lastMessageAt,
      builder: (context, data){
        final lastMessageAt = data.toLocal();  // the datetime preferences you have on your on phone or device
        final String stringDate;
        final now = DateTime.now();
        final startOfDay = DateTime(now.year,now.month,now.day);
        if(lastMessageAt.millisecondsSinceEpoch >= startOfDay.millisecondsSinceEpoch){
          stringDate = Jiffy(lastMessageAt.toLocal()).jm;
        } else if(lastMessageAt.millisecondsSinceEpoch >= startOfDay.subtract(const Duration(days:1)).millisecondsSinceEpoch){
          stringDate = 'YESTERDAY';
        } else if(startOfDay.difference(lastMessageAt).inDays < 7){ 
           stringDate = Jiffy(lastMessageAt.toLocal()).EEEE;
        } else{
           stringDate = Jiffy(lastMessageAt.toLocal()).yMd;
        }
       
        return Text(
          stringDate,
          style: const TextStyle(
            fontSize: 11,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
            color: AppColors.textFaded,

          ),

        );

      }
    ); 
 */
   
     return Text(// messageModel!.time,
           chatModel.time,
          style: const TextStyle(
            fontSize: 11,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
            color: AppColors.textFaded,
          )
     );
  }
}