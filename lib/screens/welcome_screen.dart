import 'package:explore/theme.dart';
import 'package:flutter/material.dart';
import 'package:explore/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:SafeArea(
        child: Column(
          children: <Widget>[
             // SizedBox(height:MediaQuery.of(context).size.height / 20), 
         
            // ignore: sized_box_for_whitespace
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset('assets/images/oranged.png',   
              fit: BoxFit.scaleDown,
              )
              ),
              Padding(
              padding :const EdgeInsets.symmetric(
                horizontal:8,
              ),
            child:Text('Connect with friends around the world with Explore App',
            textAlign:TextAlign.center,
            style:Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight:FontWeight.bold,
              color:AppColors.accent
              ))
              ),

           const SizedBox(height:150),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text:  TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: 'Agree and Continue to accept the ',
                      style: TextStyle(
                        color: Colors.grey[600],
                      )
                    ),
                    const TextSpan(
                      text: 'Explore Terms of Service and Privacy Policy',
                       style: TextStyle(
                        color: AppColors.accent,
                      )
                    )
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20),

        
            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
                  builder:(builder)=> const LoginScreen()),
                  (route) =>false);
              },
            // ignore: sized_box_for_whitespace
              child: Container(
                width: MediaQuery.of(context).size.width - 110,
                height: 50,
                child: const Card(
                  color: AppColors.accent,
                  elevation: 8,
                  margin: EdgeInsets.all(0),
                  child: Center(
                    child: Text(
                      'Agree and Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      )),
                ),
                
              ),
            )
            
          ]
        ),
      )
    );
  }
}