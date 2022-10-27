import 'package:explore/theme.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const OtpScreen({
    required this.number,
    required this.countrycode,
  });

  final String number;
  final String countrycode;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        centerTitle: true,
        title: Text(
          'Verify +${widget.countrycode.substring(1)} ${widget.number}',
          style: const TextStyle(
            color: AppColors.accent,
            fontSize: 16.5
          ),
        ),
        actions:<Widget>[
          IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.more_vert,
              color:AppColors.accent,
            )
            )
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:const EdgeInsets.symmetric(
          horizontal:35
        ),
        child: Column(
          children:<Widget>[
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign:TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:'We sent an SMS with a code to',
                      style:  TextStyle(
                      color: Colors.black,
                      fontSize: 14.5
                    ),
                    ),
                  TextSpan(
                    text:  ' +' + widget.countrycode.substring(1) + ' ' + widget.number,
                     style:  const TextStyle(
                    color: Colors.black,
                    fontSize: 14.5,
                    fontWeight:FontWeight.bold,
                    )),
                   const TextSpan(
                      text:' Wrong number?',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 14.5
                      )
                    )
                ]
                  )
              ),
              const SizedBox(
                height:30
              ),
               OTPTextField(
                length:6,
                width:MediaQuery.of(context).size.width,
                fieldWidth:30,
                style:const TextStyle(
                  fontSize:17,
                ),
                textFieldAlignment:MainAxisAlignment.spaceAround,
                fieldStyle:FieldStyle.box,
                onCompleted:(pin){
                  print('completed: ' + pin);
                },
              ), 
                 const SizedBox(
                    height:40
                 ),
                 Text('Enter 6-digit code',
                 style:  TextStyle(
                color:Colors.grey[600],
                fontSize:14,
              ),
                 ),
                  const SizedBox(
                    height:30
                 ),
           bottomButton(
            'Resend SMS',
            Icons.message,
           ),
             const SizedBox(
                    height:12
                 ),
            const  Divider(
              thickness: 1.5,
            ),
            const SizedBox(
                    height:12
                 ),
            bottomButton(
            'Call Me',
            Icons.call,
           ),
          ]
        ),
      ),
    );
  }

  Widget bottomButton(String text,IconData icon){
         return Row(
                children: <Widget>[
                   Icon(
                    icon,
                    color:AppColors.accent,
                    size:24
                  ),
                     const SizedBox(
                    width:25
                 ),
              Text(text,
              style: const TextStyle(
                color:AppColors.accent,
                fontSize:14.5,
              ),
              )
                ]
              );
  }
}