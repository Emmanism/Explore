
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class ActionsButton extends StatelessWidget {
// ignore: use_key_in_widget_constructors
const ActionsButton({
  required this.icon,
  required this.onTap,
});


final IconData icon;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     return InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.accent,
        onTap: onTap,
        child:Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(6),
           /*  border: Border.all(
              width: 2,
              color: Theme.of(context).cardColor,
            ), */
          ),
           child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
           icon,
           size: 23,
           color: Colors.white,
          ),
        ),



        ),
      
     );
    
  }
}