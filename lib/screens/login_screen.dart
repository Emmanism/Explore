import 'package:explore/models/country_model.dart';
import 'package:explore/screens/country_screen.dart';
import 'package:explore/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:explore/theme.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryname = 'Afghanistan';
  String countrycode = '+93';
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:0,
        title:const Text('Enter your phone number',
        style:TextStyle(
          color:AppColors.accent,
          fontWeight:FontWeight.w600,
          wordSpacing: 1,
          fontSize:18,
        )
        ),
        centerTitle:true,
        actions:const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Icon(
              Icons.more_vert,
              color:AppColors.accent,
            ),
          )
        ],
      ),

      body:Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child:Column(
          children:  <Widget>[
             const Padding(
               padding: EdgeInsets.symmetric(
                horizontal:20.0
               ),
               child: Center(
                 child: Text('Whatsapp will send an sms message to verify your number',
            style:TextStyle(
                  fontSize:13.5,
            ),
            ),
               ),
             ),
            const  SizedBox(
              height:5.0,
            ),
            const Text('What\'s my number?',
            style:TextStyle(
              color:AppColors.accent,
              fontWeight:FontWeight.w400,
              fontSize:12.8,
            ),
            ),
               const SizedBox(
              height:15.0,
            ),
              countryCard(),
              const SizedBox(
                height: 5.0,
              ),
              number(),
              const Expanded(
                child:  SizedBox() // container
                ),
              InkWell(
                onTap: (){
                  if(_controller.text.length < 10){
                    showMyDialog1();
                  } else{
                    showMyDialog();
                  }
                  
                  // showMyDialog();
                },
                child: Container(
                  color:AppColors.accent,
                  height: 40,
                  width: 70,
                  child: const Center(
                    child:  Text('NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    )),
                ),
              ),
              const SizedBox(
                height: 40,
              )
          ]
        )
      )
    );
     
  }

  Widget countryCard(){
      return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (builder)=> CountryScreen(setCountryData: setCountryData)
          ));
      },
       child: Container(
        width:MediaQuery.of(context).size.width / 1.5,
        padding:const EdgeInsets.symmetric(
          vertical: 5
        ),
        decoration: const BoxDecoration(
          border:Border(
            bottom: BorderSide(
              color:AppColors.accent,
              width:1.8
            )
          )
        ),
        child: Row(
          children:  <Widget>[
            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child:   Center(
                  child: Text(countryname,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  ),
                ),
              ),
            ),
           const  Icon(
              Icons.arrow_drop_down,
              color: AppColors.accent,
              size: 28,
            )
          ],
        ),
         ),
     );

  }

  Widget number(){
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: <Widget>[
          Container(
          width: 70,
          decoration: const BoxDecoration(
          border:Border(
            bottom: BorderSide(
              color:AppColors.accent,
              width:1.8
            )
          )
        ),
        child: Row(
          children: <Widget>[
             const SizedBox(width: 10),
            const Text('+',
            style:  TextStyle(
            fontSize: 18
            )),
            const SizedBox(width: 15),
            Text(countrycode.substring(1),
            style: const TextStyle(
              fontSize: 15
            ),
            ),
          ]
          )),
          const SizedBox(width: 30),
          Container(
            decoration: const BoxDecoration(
          border:Border(
            bottom: BorderSide(
              color:AppColors.accent,
              width:1.8
            )
          )
        ),
        width: MediaQuery.of(context).size.width / 1.5 -100,
        child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8),
          hintText: 'phone number',
        )
        ),
          )

        ],
      ),
    );
  } 

  void setCountryData(CountryModel countryModel){
    setState(() {
      countryname = countryModel.name;
      countrycode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialog(){
    return showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('We will be verifying your phone number',
              style: TextStyle(
                fontSize: 14,
              ),
              ),
             const  SizedBox(height: 10),
              Text(countrycode + '' + _controller.text,
               style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              ),
               const  SizedBox(height: 10),
              const Text('Is this ok, or would you like to edit the number?',
               style: TextStyle(
                fontSize: 13.5,
              ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
           onPressed: (){
            Navigator.pop(context);
           },
           child: const Text('Edit',
           style:TextStyle(
            fontSize:14,
            color:AppColors.accent,
           )
           
           ),
           ),
           TextButton(
            onPressed: (){
              // Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(
                builder:(builder)=>  OtpScreen(
                  countrycode: countrycode,
                  number: _controller.text,
                )
              ));

            },
             child: const Text('ok',
            style:TextStyle(
            fontSize:14,
            color:AppColors.accent,
           )
             )
             ),
        ],
      );
    });
  }
  Future<void> showMyDialog1(){
    return showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
               Text('There is no number you entered',
              style: TextStyle(
                fontSize: 14,
              ),
              ),
            ],
          ),
        ),
        actions: [
           TextButton(
            onPressed: (){
               Navigator.of(context).pop();
            },
             child: const Text('ok')
             ),
        ],
      );
    });
  }
  
}