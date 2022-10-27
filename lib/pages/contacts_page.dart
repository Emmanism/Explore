import 'package:explore/models/chat_model.dart';
import 'package:explore/models/message_model.dart';
import 'package:explore/pages/messages_page.dart';
import 'package:explore/widgets/contact_selector.dart';
import 'package:explore/widgets/display_error_message.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({
    required this.chatmodels,
    required this.sourchat,
   // required this.messageModel,
    }) ;

   final List<ChatModel> chatmodels;
   final ChatModel sourchat;
  // final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
   // ignore: deprecated_member_use
 /*   return UserListView(
   /*  pagination:const PaginationParams(
      limit: 20,
    ), */
    limit: 20,
    filter: Filter.notEqual('id',context.currentUser!.id),

    emptyBuilder:(context){
      return const Center(
        child: Text('There are no contacts.\n Connect with friends on Explore')
        );
    },
    loadingBuilder: (context){
      return const Center(
        child: CircularProgressIndicator()
        );
    },
      errorBuilder:(context, error) {
       return DisplayErrorMessage(error: error);
      },
      listBuilder: (context, items){
        return Scrollbar(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              return items[index].when(
                headerItem: (_) => const SizedBox.shrink(),
                userItem: (user) => ContactSelector(user:user),
              );
            },
        
          ),
        );
      },
   ); */
   return MessagesPage(
    chatmodels: chatmodels,
    sourchat:sourchat,
   // messageModel: messageModel,
    );
  }
}
