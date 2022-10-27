import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors{
static const secondary = Color(0xff3b76f6);
static const accent = Color(0xffd6755b);
static const textDark = Color(0xff53585a);
static const textLight = Color(0xfff5f5f5);
static const textFaded = Color(0xff9899a5);
static const iconLight = Color(0xffb1b4c0);
static const iconDark = Color(0xffb1b3c1);
static const textHighlight = secondary;
static const cardLight = Color(0xfff9fefa);
static const cardDark = Color(0xff303334);
//static const messageDark = Color(0xfff5f5f5);
//static const messageLight = Color(0xff53585a);

}



abstract class _LightColors{
  static const background = Colors.white;
  static const  card = AppColors.cardLight;
}

abstract class _DarkColors{
  static const background = Color(0xff1b1e1f);
  static const card = AppColors.cardDark;
}

// reference to application theme
 class AppTheme{
  static const accentColor = AppColors.accent;
  static final visualDensity =  VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();


// light theme and its settings.
   ThemeData get light => ThemeData(
    brightness: Brightness.light,
    colorScheme:lightBase.colorScheme.copyWith(
      secondary:accentColor,
    ),
  visualDensity: AppTheme.visualDensity,
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(primary: accentColor),
        ),
  textTheme: GoogleFonts.mulishTextTheme()
  .apply( bodyColor :AppColors.textDark),
  backgroundColor: _LightColors.background,
  scaffoldBackgroundColor: _LightColors.background,
  cardColor: AppColors.textLight,
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.textDark,
    )
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconDark,
  ),
  //highlightColor:AppColors.messageDark,
);

// dark theme and its settings.
   ThemeData get dark => ThemeData(
      brightness: Brightness.dark,
    colorScheme:darkBase.colorScheme.copyWith(
      secondary:accentColor,
    ),
  visualDensity: AppTheme.visualDensity,
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(primary: accentColor),
        ),
  textTheme: GoogleFonts.interTextTheme()
  .apply(bodyColor :AppColors.textLight),
  backgroundColor: _DarkColors.background,
  scaffoldBackgroundColor: _DarkColors.background,
  cardColor: _DarkColors.card,
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.textLight,
    )
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconLight,
  ),
  //highlightColor:AppColors.messageLight,



);
}
