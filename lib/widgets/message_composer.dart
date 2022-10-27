/* import 'dart:io';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:explore/models/chat_model.dart';
import 'package:explore/models/message_model.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/attach_file_button.dart';
import 'package:explore/widgets/glowing_action_button.dart';
import 'package:explore/widgets/record_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:explore/screens/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageComposer extends StatefulWidget {
  const MessageComposer({
    required this.sourchat,
    required this.chatModel,
   });

  final ChatModel sourchat;
  final ChatModel chatModel;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  final TextEditingController _controller = TextEditingController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  late  bool sendButton = false;
  late IO.Socket socket;
   List <MessageModel> messages = [];
   final  ScrollController _scrollController = ScrollController();

 /*  Future<void> _sendMessage() async {
    if (controller.text.isNotEmpty) {
      StreamChannel.of(context)
          .channel
          .sendMessage(Message(text: controller.text));
      controller.clear();
    } 
      
  }
 */

  
/* 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } */

  /* void _recordingFinishedCallback(String path) {
    final uri = Uri.parse(path);
    File file = File(uri.path);
    file.length().then(
      (fileSize) {
        StreamChannel.of(context).channel.sendMessage(
              Message(
                attachments: [
                  Attachment(
                    type: 'voicenote',
                    file: AttachmentFile(
                      size: fileSize,
                      path: uri.path,
                    ),
                  )
                ],
              ),
            );
      },
    );
  } 
 */

   void sendMessage(String message,int sourceId,int targetId){
    setMessage('source',message);
    socket.emit('message',
    {'message':message,'sourceId':sourceId,'targetId':targetId}
    );
   }
   

 void setMessage(String type, String message){
      MessageModel messageModel = MessageModel(
        message: message,
        type: type,
        time:DateTime.now().toString().substring(10,16));
      setState(() {
        setState(() {
          messages.add(messageModel);
        });
      });
    }
    

  @override
  // ignore: override_on_non_overriding_member
  void inistate(){
    super.initState();
    focusNode.addListener(() {
     if(focusNode.hasFocus){
      setState(() {
        show = false;   
      });

     }
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                        widget.chatModel.id
                        )
                    ),
                  ),
                ),
               const AttachFileButton(),
               /*  RecordButton(
                  recordingFinishedCallback: _recordingFinishedCallback,
                ), */
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
}
 */