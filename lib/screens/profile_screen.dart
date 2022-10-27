import 'package:explore/models/chat_model.dart';
import 'package:explore/screens/select_user_screen.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:explore/widgets/actions_button.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
const ProfileScreen  ({
  required this.sourchat,
 // required this.messageModel,
  });
   // ({Key? key}) : super(key: key);

   final ChatModel sourchat;
   // final MessageModel messageModel;

  

  @override
  Widget build(BuildContext context) {
   // final user = context.currentUser;
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
                      child:Text('Theme',
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
        body: GestureDetector(
           onTap: () => FocusScope.of(context).unfocus(),
          child: Column(children: <Widget>[
           const  Padding(
              padding: EdgeInsets.only(
              top:35,
              bottom:15,
              left:30,
              right:30,
              ),
             child:Hero(
              tag: 'hero-profile-picture',
              child: Avatar.large(
                // url: user?.image,
              ), 
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                sourchat.name,
               // user?.name ?? 'No name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:20,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                top:20.0,
              )
                ,
              child: SizedBox(
                height:80,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: <Widget>[
                    const Padding(
                       padding:  EdgeInsets.only(
                        bottom: 30.0,
                        left: 10.0,
                       ),
                       child:  Icon(CupertinoIcons.info,
                       size: 30,
                       color: AppColors.accent,
                       ),
                     ),
                    const SizedBox(width: 19),
                    Expanded(
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text('About',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(height: 20),
                          TextField(
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Write a message',
                              
                            ),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
        
                  const Padding(
                     padding:  EdgeInsets.only(
                      right: 6.0,
                      left: 12.0,
                      bottom:30.0,
                     ),
                     child:  Icon(CupertinoIcons.pencil,
                     size: 30,
                     color: AppColors.accent,
        
                     )
                   ),
        
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
             SignOutButton(
            //  messageModel: messageModel,
            ),
          ]),
        ));
  }
}

class SignOutButton extends StatefulWidget {
  const SignOutButton //({ required this.messageModel});
  ({Key? key}) : super(key: key);

   // final MessageModel messageModel;

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  bool _loading = false;
  // late MessageModel messageModel;

  Future<void> _signOut() async {
    setState(() {
      _loading = true;
    });

   /*  try {
      await StreamChatCore.of(context).client.disconnectUser();
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(SelectUserScreen.route);
    } on Exception catch (e, st) {
      logger.e('could not connect user', e, st);
      setState(() {
        _loading = false;
      });
    } */
    //  Navigator.of(context).push(SelectUserScreen.route);
      Navigator.push(context, MaterialPageRoute(
                      builder:(builder)=> const SelectUserScreen(
                        // messageModel:widget.messageModel,
                        )
                        ));
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? const CircularProgressIndicator()
        : TextButton(onPressed: _signOut, child: const Text('Sign out'));
  }
}
