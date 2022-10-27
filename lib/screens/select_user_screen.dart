import 'package:explore/widgets/avatar.dart';
import 'package:explore/models/chat_model.dart';
import 'package:explore/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SelectUserScreen extends StatefulWidget {
 /*  static Route get route =>
      MaterialPageRoute(builder: (context) => const SelectUserScreen()); */
  const SelectUserScreen // ({required this.messageModel});
  ({Key? key}) : super(key: key);
 // final MessageModel messageModel;

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  bool _loading = false;
  late ChatModel sourceChat;
 // late MessageModel messageModel;
 // late ChatModel chatModel;

  /* Future<void> onUserSelected(DemoUser user) async {
    setState(() {
      _loading = true;
    });

    try {
      final client = StreamChat.of(context).client; //streamchatcore
      await client.connectUser(
        User(
          id: user.id,
          extraData: {
            'name': user.name,
            'image': user.image,
          },
        ),
        client.devToken(user.id).rawValue,
      );

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } on Exception catch (e, st) {
      logger.e('could not connect user', e, st);
      setState(() {
        _loading = false;
      });
    }
  }
 */

   List<ChatModel> chatmodels = [
    ChatModel(
    name: 'DevStack', 
   // icon: '', 
    time: '4:00', 
    currentMessage: 'Hi Everyone',
    isGroup:false,
    id: 1
    ),

    ChatModel(
    name: 'Kishor', 
   // icon: '', 
    time: '10:00', 
    currentMessage: 'Hi Kishor',
     isGroup:false,
     id: 2
    ),

    ChatModel(
    name: 'Collins', 
   // icon: '', 
    time: '10:00', 
    currentMessage: 'Hi DevStack',
     isGroup:false,
     id: 3
    ),

    ChatModel(
    name: 'Balram ralthore', 
   // icon: '', 
    time: '10:00', 
    currentMessage: 'Hi DevStack',
     isGroup:false,
     id: 4
    )
   ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:(_loading)
        ? const CircularProgressIndicator()
        :
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
            const Padding(
               padding:  EdgeInsets.all(32.0),
               child:  Text(
                  'Select a user',
                  style: TextStyle(
                    letterSpacing:0.4,
                    fontSize:24,
                  )
                ),
             ),
              Expanded(
                child:ListView.builder(
                  itemCount:chatmodels.length,
                  itemBuilder:(BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        sourceChat = chatmodels.removeAt(index);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            chatmodels:chatmodels,
                            sourchat:sourceChat,
                           // messageModel: widget.messageModel,
                            ),
                          ));
                      },
                      child: SelectUserButton(
                       name: chatmodels[index].name
                      ),
                    );
                  }
            
                ),
              )

            ]
          ),
        )
      )
    );
  }
}



class SelectUserButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SelectUserButton ({
   // required this.user,
    required this.name,
   //  required this.icon,
  });

  // final Function(DemoUser user) onPressed;
  final String name;
  // final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children:<Widget>[
         Avatar.large(
           // url:user.image,
          ), 
         /*  CircleAvatar(
            radius:54,
            backgroundColor: Theme.of(context).cardColor,
              child:SvgPicture.asset(
               'assets/person.svg',
               color:Colors.white,
               height:42,
                width:42
          )
        ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
              //user.name,
            style: const TextStyle(
              fontSize: 16,
            ),
            ),
          )
      
        ]
      
      ),
    );
  }
}