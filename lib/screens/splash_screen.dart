import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:explore/screens/welcome_screen.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: <Widget>[
          Image.asset('assets/images/splashed.png',
          width:150,
          height:150,
          ),
          const  Text('Explore',
          style: TextStyle(
            color: AppColors.accent,
            fontWeight:FontWeight.bold,
            fontSize:30
          ),
          
          )

        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: const WelcomeScreen(),
      splashIconSize: 200,
      splashTransition:SplashTransition.fadeTransition,
      duration:8000,
      pageTransitionType:PageTransitionType.topToBottom,
      animationDuration:const Duration(seconds:2),
    );
  }
}