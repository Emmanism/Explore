import 'package:explore/models/chat_model.dart';
import 'package:explore/pages/calls_page.dart';
import 'package:explore/pages/contacts_page.dart';
import 'package:explore/pages/camera_page.dart';
import 'package:explore/screens/camera_screen.dart';
import 'package:explore/screens/profile_screen.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:explore/widgets/glowing_action_button.dart';
import 'package:explore/widgets/navigation_bar_item.dart';
import 'package:explore/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/messages_page.dart';

final List pageTitle = [
  'Messages',
  'Camera',
  'Calls',
  'Contacts',
];

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({
    required this.chatmodels,
    required this.sourchat,
   // required this.messageModel,
   // required this.chatModel,
    
    });

  final List<ChatModel> chatmodels;
  final ChatModel sourchat;
  // final MessageModel messageModel;
   // final ChatModel chatModel;

   


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('messages');
  late List<Widget> pages ;
  late Function onImageSend;

/*
 final List pages = [
   MessagesPage(
    chatmodels:widget.chatmodels
  ),
  const StatusPage(),
  const CallsPage(),
  const ContactsPage(),
];  */

  @override
  void initState() {
    // TODO: implement initState
  pages = <Widget>[
    MessagesPage(
      chatmodels:widget.chatmodels,
      sourchat:widget.sourchat,
     // messageModel: widget.messageModel,

     ),
    CameraPage(
      cameras: cameras,
    ),
    const CallsPage(),
     ContactsPage(
       chatmodels:widget.chatmodels,
       sourchat:widget.sourchat,
       // messageModel: widget.messageModel,
     )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         // iconTheme: Theme.of(context).iconTheme,
          backgroundColor: AppColors.accent,
          elevation: 0,
          title: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
      
            },
          ),
          
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: SearchButton(
              icon:Icons.search,
              onTap: (){},
            ),
          ),

            actions:<Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Hero(
                    tag:'hero-profile-picture',
                    child: Avatar.small(
                     // url: context.currentUserImage,
                      onTap: (){
                       // Navigator.of(context).push(ProfileScreen.route);
                        Navigator.push(context, MaterialPageRoute(
                      builder:(builder)=> ProfileScreen(
                        sourchat:widget.sourchat,
                       // messageModel: widget.messageModel,
                        )
                        ));
                      },
                    ),
                  ),
                )
              ], 

      
        ),
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: ((BuildContext context, int value, _) {
            return pages[value];
          }),
        ),
        bottomNavigationBar: _BottomNavigationBar(
          onItemSelected: _onNavigationItemSelected,
          chatmodels:widget.chatmodels,
          sourchat: widget.sourchat,
         // messageModel: widget.messageModel,
        ));
  }

    void _onNavigationItemSelected(index) {
      title.value = pageTitle[index];
          pageIndex.value = index;
        }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    required this.onItemSelected,
    required this.chatmodels,
    required this.sourchat,
   // required this.messageModel,
    
    });

  final ValueChanged<int> onItemSelected;
   final List<ChatModel> chatmodels;
   final ChatModel sourchat;
   // final MessageModel messageModel;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    //final brightness = Theme.of(context).brightness;
    return Card(
      //color: (brightness == Brightness.light)? Colors.transparent:null,
      //elevation:0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(
              top:16,
              left: 8,
              right: 8,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    NavigationBarItem(
                      index: 0,
                      lable: 'Messages',
                      icon: CupertinoIcons.bubble_left_bubble_right_fill,
                      isSelected: (selectedIndex == 0),
                      onTap: handleItemSelected,
                    ),
                    NavigationBarItem(
                      index: 1,
                      lable: 'Camera',
                      icon: CupertinoIcons.camera_fill,
                      isSelected: (selectedIndex == 1),
                      onTap: handleItemSelected,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2.0,
                      ),
                      child: GlowingActionButton(
                        color: AppColors.accent,
                       icon: CupertinoIcons.add,
                        onpressed: (){
                          showDialog(
                            context:context,
                            builder: (BuildContext context) =>
                             Dialog(
                              child: AspectRatio(
                                aspectRatio: 8 / 7,
                                child: ContactsPage(
                                  chatmodels:widget.chatmodels,
                                  sourchat: widget.sourchat,
                                 // messageModel: widget.messageModel,
                                  
                                  )
                                ),
                            ),

                          );
                        },
                        ),
                    ),
                    NavigationBarItem(
                      index: 2,
                      lable: 'Calls',
                      icon: CupertinoIcons.phone_fill,
                      isSelected: (selectedIndex == 2),
                      onTap: handleItemSelected,
                    ),
                    NavigationBarItem(
                      index: 3,
                      lable: 'Contacts',
                      icon: CupertinoIcons.person_2_fill,
                      isSelected: (selectedIndex == 3),
                      onTap: handleItemSelected,
                    ),
                  ]),
            ),
          )),
    );
  }
}
