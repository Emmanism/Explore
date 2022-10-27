import 'package:explore/models/chat_model.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:explore/widgets/actions_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:explore/theme.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({required this.chatModel});

  /*  static Route get route =>
      MaterialPageRoute(builder: (context) => const UserProfileScreen()); */

    final ChatModel chatModel;

      

  @override
  Widget build(BuildContext context) {
  // final user = context.currentUser;
   //  final channel = StreamChannel.of(context).channel;
    return Scaffold(
       appBar: AppBar(
          backgroundColor: AppColors.accent,
          centerTitle: false,
          elevation: 0,
          leadingWidth: 45,
          leading: Align(
            alignment: Alignment.centerRight,
            child: ActionsButton(
              icon: CupertinoIcons.back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: const Text('Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              actions:  <Widget>[
                   PopupMenuButton(
                    itemBuilder:(context) => [
                     const PopupMenuItem(
                      child:Text('Report',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
                      ),
                     const PopupMenuItem(
                      child:Text('Block',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
                      ),
                     const PopupMenuItem(
                      child:Text('Share',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
                      ),
                     const PopupMenuItem(
                      child:Text('Edit',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
                      )
                    ],
                     child:const Padding(
                       padding: EdgeInsets.only(
                        right:10.0
                       ),
                       child: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        ),
                     ),
                   ), 

              ],
        ),

        body: Column(
          children:  <Widget>[
            const  Padding(
               padding: const  EdgeInsets.only(
               top:35,
              bottom:15,
              left:30,
              right:30,
               ),
               child: Hero(
                 tag: 'hero-profile-picture',
                 child:  Avatar.large(
                    // url:  user?.image //this is the user image,will solve the client own later on 
                  ),
               ),
             ),

              Padding(
               padding:  const EdgeInsets.all(8.0),
               child: Text(chatModel.name,
                // user?.name ?? 'No name',  
                style: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20,
                )
               ),
             ),

             const SizedBox(height: 20),
             
             Padding(
               padding: const EdgeInsets.symmetric(
                horizontal: 83,
                vertical:35,
               ),
               child: Align(
                alignment:Alignment.center,
                 child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                         iconText(
                      Icons.phone,
                      'Audio',
                      (){}
                    ),
                   const SizedBox(width: 30),
                    iconText(
                      Icons.video_camera_back,
                      'Video',
                      (){}
                    ),
                    const SizedBox(width: 30),
                    iconText(
                      Icons.search,
                      'Search',
                      (){}
                    )
                      ],
                    )
                  ],
                 ),
               ),
             )

             
          ],
        )
    );
  }

  Widget iconText(IconData icon, String text,VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size:35,
            color: AppColors.accent,
          ),
           const SizedBox(height:5.0),
            Text(text,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.accent
          ),
          ),
    
        ],
      ),
    );
  }
}