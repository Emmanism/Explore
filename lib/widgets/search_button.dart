import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
// ignore: use_key_in_widget_constructors
const SearchButton({
  required this.icon,
  required this.onTap,

});

final IconData icon;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardLight,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
         borderRadius: BorderRadius.circular(6),
         splashColor: AppColors.accent,
         onTap: onTap,
         child: Padding(
           padding: const EdgeInsets.all(6.0),
           child: Icon(
            icon,
            size: 18,
            color: AppColors.textDark,

           ),
         ),

      )
    );
  }
}