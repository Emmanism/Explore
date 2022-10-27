/* 
import 'package:explore/helpers.dart';
import 'package:explore/models/chat_model.dart';
import 'package:explore/screens/user_profile_screen.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:explore/widgets/connection_status_builder.dart';
import 'package:explore/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:collection/collection.dart' show IterableExtension;

class AppTitle extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AppTitle ({required this.chatModel});



   final ChatModel chatModel;

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  late ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
   // final channel = StreamChannel.of(context).channel;
    return Row(
      children: <Widget>[
        Avatar.small(
         // url: Helpers.getChannelImage(channel, context.currentUser!),
          onTap: (){
              Navigator.of(context).push(UserProfileScreen.route);
          }, // this will not be null
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Text(chatModel.name,
                  // Helpers.getChannelName(channel, context.currentUser!), this will not be null
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
                ),
                const SizedBox(
                  height: 2,               
                ),

                const Text('Online now',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color:Colors.white,
                ),
                ),
                 

             /*    BetterStreamBuilder<List<Member>>(
                  stream: channel.state!.membersStream,
                  initialData: channel.state!.members,
                  builder: (context, data) =>  ConnectionStatusBuilder(
                      statusBuilder:(context, status){
                      switch(status){
                        case ConnectionStatus.connected:
                        return _buildConnectedTitleState(context, data);
                         case ConnectionStatus.connecting:
                         return const Text(
                          'Connecting',  // connecting
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )
                         );
                         case ConnectionStatus.disconnected:
                         return const Text(
                          'Offline', 
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )
                         );
                         default:
                         return const SizedBox.shrink();
                      };
                      
                    },
                  ),

                ), */
          
              ]
            ),
          )
      ]

    ); 
  }
} */