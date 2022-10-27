import 'package:explore/models/chat_model.dart';
import 'package:explore/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    required this.chatmodels,
    required this.sourchat,
   // required this.messageModel,
    
    });

   final List<ChatModel> chatmodels;
   final ChatModel sourchat;
  // final MessageModel messageModel;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  // final channelListController = ChannelListController();
  

  @override
  Widget build(BuildContext context) {
  /*   // ignore: deprecated_member_use
     return ChannelListView(// channellistcore
      channelListController : channelListController,
      // ignore: deprecated_member_use
      pagination: const PaginationParams(limit: 30),
      filter: Filter.and(
        [
          Filter.equal('type', 'messaging'),
          Filter.in_('members', [
            StreamChat.of(context).currentUser!.id, // streamchatcore
          ])
        ]
      ),
      emptyBuilder:(context) => 
     const  SafeArea(
        top: true,
        bottom:false,
        child:  Align(
          alignment: Alignment.center,
          child:  Text('So empty.\n Go and messages some someone.',
           textAlign: TextAlign.center,
           ),
        ),
      ),
     
      errorBuilder:(context, error) => DisplayErrorMessage(error: error),
      loadingBuilder: (context) => 
      const Center(
        child: SizedBox(
          height: 100,
          width:100,
          child:  CircularProgressIndicator()
          ),
      ),
      listBuilder: (context, channels){
          return CustomScrollView(
      slivers :[
       const SliverToBoxAdapter(
          child:StorySelector(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
         (context, index){
          return   RecentChats(
            channel: channels[index],
          );
         },
         childCount: channels.length,
          )
        )
      ],
    );  
      }
    );  */

   /*  return  ListView.builder(
      itemCount: widget.chatmodels.length,
      itemBuilder: (BuildContext context, int index) =>
       RecentChats(
        chatModel: widget.chatmodels[index],
        sourchat:widget.sourchat,
        )
      ); 
 */
 
           return CustomScrollView(
      slivers :[
       /* const SliverToBoxAdapter(
          child:StorySelector(),
        ),  */
        SliverList(
          delegate: SliverChildBuilderDelegate(
         (context, index){
          return   RecentChats(
             chatModel: widget.chatmodels[index],
              sourchat:widget.sourchat, 
              chatmodels:widget.chatmodels,
              // messageModel:widget.messageModel,

          );
         },
         childCount: widget.chatmodels.length
          )
        )
      ],
    );  
  }
}
