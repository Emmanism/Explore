import 'dart:convert';
import 'package:explore/screens/camera_screen.dart';
import 'package:explore/screens/camera_view_screen.dart';
import 'package:explore/widgets/date_lable.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:explore/models/chat_model.dart';
import 'package:explore/models/message_model.dart';
import 'package:explore/screens/user_profile_screen.dart';
import 'package:explore/widgets/actions_button.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:explore/widgets/image_tile.dart';
import 'package:explore/widgets/own_image_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:explore/widgets/glowing_action_button.dart';
import 'package:explore/screens/home_screen.dart';
import 'package:explore/widgets/message_own_tile.dart';
import 'package:explore/widgets/message_tile.dart';
import 'package:explore/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore/theme.dart';
import 'package:jiffy/jiffy.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;




class ChatsScreen extends StatefulWidget {
 /*  static Route routeWithChannel(Channel channel) => 
  MaterialPageRoute(
    builder: (context) => StreamChannel(
      channel:channel,
      child:const ChatsScreen(),
    )
  ); */
 /*   static Route get route =>
      MaterialPageRoute(builder: (context) => const ChatsScreen()); */
  // ignore: use_key_in_widget_constructors
  const ChatsScreen({
    required this.sourchat,
     required this.chatModel,
     required this.chatmodels,
    // required this.messageModel,
    });


    final ChatModel sourchat;
    final ChatModel chatModel;
    final List<ChatModel> chatmodels;
   // final MessageModel messageModel;

    

  

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
 // late StreamSubscription<int> unreadCountSubcription; 
 final TextEditingController _controller = TextEditingController();
 late  bool sendButton = false;
 late IO.Socket socket;
 FocusNode focusNode = FocusNode();
 bool show = false;
 List <MessageModel> messages = [];
 final  ScrollController _scrollController = ScrollController();
 final ImagePicker _picker = ImagePicker();
 int popTime = 0;
 late XFile file;
 late  DateTime dateTime;
 // late String dayInfo;

 



  @override
  void initState() {
/*     if (mounted) {
      unreadCountSubcription = StreamChannel.of(context)
        .channel
        .state!
        .unreadCountStream
        .listen(_unreadCountHandler);
    } */
    super.initState();
     connect();
      focusNode.addListener(() {
     if(focusNode.hasFocus){
      setState(() {
        show = false;   
      });

     }
    }); 
  }
/* 
  Future<void> _unreadCountHandler(int count) async {
    if (count > 0) {
      await StreamChannel.of(context).channel.markRead();
    }
  } */

 /*  @override
  void dispose(){
     unreadCountSubcription.cancel();
     super.dispose;
    
  }
   */
  
 
  
  

  void connect() {
    socket = IO.io('http://192.168.43.199:5000/',<String,dynamic> {// generic type  heroku:https://secret-chamber-91238.herokuapp.com/
      'transports':['websocket'],
      'autoConnect':false,
    });
    socket.connect();
     socket.emit('signin',widget.sourchat.id); // an event which will be listened to the backend 
    socket.onConnect((data) {
      // ignore: avoid_print
      print('connected');
      socket.on('message',(msg){
         // ignore: avoid_print
        print(msg);
        setMessage('destination',
        msg['message'],
        msg['path'],
        );
         _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
             duration:const  Duration(milliseconds: 300),
             curve: Curves.easeOut
         );
      });
    }); 
     // ignore: avoid_print
    print(socket.connected);
    }

    
   void sendMessage(String message,int sourceId,int targetId,String path){
    setMessage('source',message,path);
    socket.emit('message',
    {'message':message,
    'sourceId':sourceId,
    'targetId':targetId,
    'path':path,
    }
    );
   }
   

    
 void setMessage(String type, String message, String path){
      MessageModel messageModel = MessageModel(
        message: message,
        type: type,
        path: path,
         time:DateTime.now().toString().substring(10,16)
        );
      print(messages);
      setState(() {
        messages.add(messageModel);
      });
    }
    
void onImageSend(String path,String message) async{
      print('hey there,it\'s working $message');
      for(int i=0;i < popTime; i++){
        Navigator.pop(context);
      }
      setState(() {
        popTime = 0;
      });

    var request = http.MultipartRequest(
      'POST',Uri.parse('http://192.168.43.199:5000/routes/addImage'));
      request.files.add(await http.MultipartFile.fromPath('img', path));
      request.headers.addAll(
        {'content-type':'multipart/form-data',
        });
       /*   http.StreamedResponse response = await request.send(); // to the backend user response
        var httpResponse = await http.Response.fromStream(response);
        var data = json.decode(httpResponse.body);
        print(data['path']);  */
        await request.send().then((response) {
        http.Response.fromStream(response).then((value) {
        print(value.statusCode);    
        print(value.body);
        });
        }); 

    setMessage('source',message,path);
     socket.emit('message',
      {'message':message,
      'sourceId':widget.sourchat.id,
      'targetId':widget.chatModel.id,
      'path':path,
    });
    } 
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.accent,
        centerTitle: false,
        elevation:0,     
          leadingWidth: 45,
          leading: Align(
            alignment: Alignment.centerRight,
            child: SearchButton(
              icon:CupertinoIcons.back,
              onTap: (){
                 Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (_)=> HomeScreen(
                sourchat: widget.sourchat,
                chatmodels:widget.chatmodels,
               // messageModel: widget.messageModel,
                // chatModel: widget.chatModel,
                )));
              },
            ),
          ),

          /*  title:  AppTitle(
            chatModel:chatModel // chatmodel!= is not null
           ),  */
           title:Row(
            children: <Widget>[
               Avatar.small(
         // url: Helpers.getChannelImage(channel, context.currentUser!),
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(
                      builder:(builder)=> UserProfileScreen(
                        chatModel:widget.chatModel,
                        )
                        ));
          }, // this will not be null
          ),
         const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Text(widget.chatModel.name,
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
                 

          
              ]
            ),
          )
      ]
    ), 

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
             child:Center(
               child: ActionsButton(
                icon:CupertinoIcons.video_camera_solid,
                onTap:(){},

               ),
             ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Center(
                child: ActionsButton(
                  icon: CupertinoIcons.phone_solid,
                   onTap: (){},
                   ),
              ),
            ),

            PopupMenuButton(
              itemBuilder: (context) => [
              const PopupMenuItem(  
                      child: Text('View Contact',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
              ),
              const PopupMenuItem(  
                      child: Text('Report',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
              ),
              const PopupMenuItem(  
                      child: Text('Block',
                    style: TextStyle(
                    //  color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
              ),
              const PopupMenuItem(  
                      child: Text('Search',
                    style: TextStyle(
                     // color: AppColors.textFaded,
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
              ),
               PopupMenuItem(  
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const <Widget> [
                           Text('More',
                    style: TextStyle(
                         // color: AppColors.textFaded,
                            fontWeight: FontWeight.w500,  
                            fontSize: 14.0,      
                    )
                    ),
                    Icon(Icons.arrow_drop_down,
                    size: 14.0,
                    color: AppColors.textDark,
                    
                    )
                        ],
                      ),
              ),
        ],
              child: const Padding(
                padding:  EdgeInsets.only(
                  right:10.0,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    ), 
                ),
              ),
            )
            
            
          ],
      ),

      body:  GestureDetector(
         onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
            children:   [
             /*   Expanded(
                // ignore: deprecated_member_use
                child: MessageListView(
                  loadingBuilder: (context){
                    return const Center(
                      child : CircularProgressIndicator()
                      );
                  },
                  emptyBuilder: (context) => const SizedBox.shrink(),
                  errorBuilder: (context,error) => DisplayErrorMessage(error: error),
                  messageListBuilder: (context,messages){
                    return MessageList(messages:messages); 
                  },
                  messageBuilder: (context,details,message,defaultMessage){
                    return defaultMessage.copyWith(
                      customAttachmentBuilders:{
                         'voicenote':(context,defaultMessage,attachments){
                          final url = attachments.first.assetUrl;
                          if (url == null){
                            return const AudioLoadingMessage();
                          }
                          return AudioPlayerMessage(
                            source:AudioSource.uri(Uri.parse(url)),
                            id:defaultMessage.id,
                          );
                         },
                      },
                    );
                  }
                  
                ),  
                ),  */

                Expanded(
                  child: ListView.builder( // builder
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: messages.length + 1,
                    itemBuilder: (context,index){
                      if(index == messages.length){
                        return Container(
                          height: 70,
                        );
                      } 
                      if (messages.isEmpty) { // if message is less than  1
                        return const SizedBox.shrink();
                       }
                       /*  if (index <= messages.length) {
                        final message = messages[index];
                       final nextMessage = messages[index + 1];
                      final createdAt = Jiffy(widget.dateTime);
                         if (!Jiffy(message.createdAt.toLocal())
                          .isSame(nextMessage.createdAt.toLocal(), Units.DAY)) {
                            return DateLable(dateTime: messages[index].createdAt);
                          }
                      }   */
                      if(messages[index].type == 'source'){
                       if(messages[index].path.length > 0){ // != null
                        return  OwnImageTile(
                          path: messages[index].path,
                          message: messages[index].message,
                          time:messages[index].time
                        );
                       } else{
                         return  MessageOwnTile(
                          message:  messages[index].message,
                          time:messages[index].time,
                        );
                       }
                      }
                      else{
                        if(messages[index].path.length > 0){
                          return ImageTile(
                          path: messages[index].path,
                          message: messages[index].message,
                          time:messages[index].time,
                          );
                      }else{
                         return  MessageTile(
                          message: messages[index].message,
                          time:messages[index].time,
                        );
                      }
                    }
                    }
                  ),
                ),

                /*   MessageComposer(
                  sourchat: sourchat,
                  chatModel: chatModel //  chatmodel!=is not a null statement
                ), */
                WillPopScope(
      child:  SafeArea(
        bottom: true,
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right:BorderSide(
                        width: 2,
                        color:Theme.of(context).dividerColor,
                      ),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.emoji_emotions_outlined),
                      onPressed: () {
                        setState(() {
                          focusNode.unfocus();
                          focusNode.canRequestFocus = false;
                          show = !show; // show is the negative of show(true)
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: TextField(
                      focusNode: focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines:5,
                      minLines:1,
                      controller: _controller,
                      onChanged: (value) {
                       // StreamChannel.of(context).channel.keyStroke();
                       if(value.length > 0){
                        setState((){
                          sendButton = true;
                        });
                       }
                       else{
                         setState((){
                          sendButton = true;
                        });
                       }
                      },
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Send a Message',
                        hintStyle: TextStyle(color:AppColors.textFaded),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => sendMessage(
                        _controller.text,
                        widget.sourchat.id,
                        widget.chatModel.id,
                        '',
                        )
                    ),
                  ),
                ),
             //  const AttachFileButton(),
               /*  RecordButton(
                  recordingFinishedCallback: _recordingFinishedCallback,
                ), */
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: (){
                showModalBottomSheet(
                 backgroundColor:Colors.transparent,
                 context: context, 
                 builder: (builder) =>
                  bottomSheet()
              );
          },
    ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 5.0,
                  ),
                  child: GlowingActionButton(
                    color: AppColors.accent,
                    icon: sendButton ? Icons.send_rounded 
                    : Icons.mic,
                    onpressed:() {
                      if(sendButton){
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration:const  Duration(milliseconds: 300),
                          curve: Curves.easeOut
                        );
                        sendMessage(
                        _controller.text,
                        widget.sourchat.id,
                        widget.chatModel.id,
                        '',
                        );
                        _controller.clear();
                        setState(() {
                          sendButton = false;
                        });
                    }
                    }
                  ),
                )
              ],
            ),
            show ? emojiSelect() : const SizedBox.shrink(), // container()
            // if show is true which is fALSE show emojiselect else show empty sizedbox
          ],
        ),
      ),
      onWillPop: (){
        if(show){ // if show is true
          setState(() {
            show = false;
          });
        }
         else{
            Navigator.of(context);
          }
          return Future.value(false);
      },
    ),
            ],
          ),
      ),
    );
  }

    Widget emojiSelect() {
    return EmojiPicker(
        rows: 4, 
        columns: 7, 
        onEmojiSelected: (emoji, catogory) {
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });

        });
  }

  
Widget bottomSheet(){
  // ignore: sized_box_for_whitespace
  return  Container(
    height: 278,
    width: MediaQuery.of(context).size.width, // width
    child:Card(
      margin: const EdgeInsets.all(18),
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children:<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                iconCreation(
                  Icons.insert_drive_file,
                  Colors.indigo,
                  'Document',
                  (){}
                ),
               const SizedBox(width: 40),
                iconCreation(
                  Icons.camera_alt,
                  Colors.pink,
                  'Camera',
                  (){
                    setState(() {
                      popTime = 3;
                    });
                    Navigator.push(
                      context,MaterialPageRoute(
                      builder: (builder) =>  CameraScreen(
                        onImageSend: onImageSend,
                      )));
                  }
                ),
                const SizedBox(width: 40),
                iconCreation(
                  Icons.insert_photo,
                  Colors.purple,
                  'Gallery',
                  () async{
                    setState(() {
                      popTime = 2;
                    });
                     file =
                     (await  _picker.pickImage(source: ImageSource.gallery))!;
                     // ignore: use_build_context_synchronously
                     Navigator.push(context, MaterialPageRoute(
                      builder:(builder)=>CameraViewScreen(
                        path: file.path,
                        onImageSend: onImageSend,
                        )
                        ));
                  },
                )
              ]
            ),
            const SizedBox(
              height: 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                iconCreation(
                  Icons.headset,
                  Colors.orange,
                  'Audio',
                  (){}
                ),
               const SizedBox(width: 40),
                iconCreation(
                  Icons.location_pin,
                  Colors.teal,
                  'Location',
                  (){}
                ),
                const SizedBox(width: 40),
                iconCreation(
                  Icons.person,
                  Colors.blue,
                  'Contacts',
                  (){}
                )
              ]
            )
          ]
        ),
      )
    )
  );
}

  
Widget iconCreation(IconData icon,Color color,String text,VoidCallback onTap){ // function onTap
  return InkWell(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
          icon,
          size: 29,
          color: Colors.white,
          )
        ),
        const SizedBox(height:5.0),
        Text(text,
        style: const TextStyle(
          fontSize: 12,
        ),
        ),
      ],
    ),
  );
}
 
}

class DateLable extends StatefulWidget {
// ignore: use_key_in_widget_constructors
  const DateLable({required this.dateTime});

//final String lable;
  final DateTime dateTime;

  @override
  State<DateLable> createState() => _DateLableState();
}

class _DateLableState extends State<DateLable> {
  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy(widget.dateTime);
    final now = DateTime.now();

    if (Jiffy(createdAt).isSame(now, Units.DAY)) {
      dayInfo = 'TODAY';
    } else if (Jiffy(createdAt)
        .isSame(now.subtract(const Duration(days: 1)), Units.DAY)) {
      dayInfo = 'YESTERDAY';
    } else if (Jiffy(createdAt)
        .isAfter(now.subtract(const Duration(days: 7)), Units.DAY)) {
      dayInfo = createdAt.EEEE;
    } else if (Jiffy(createdAt)
        .isAfter(Jiffy(now).subtract(years: 1), Units.DAY)) {
      dayInfo = createdAt.MMMd;
    } else {
      dayInfo = createdAt.MMMd;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: Text(
              dayInfo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}