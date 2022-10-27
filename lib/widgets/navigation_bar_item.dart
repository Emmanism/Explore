
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const NavigationBarItem({
   required this.lable,
   required this.icon,
   required this.index,
   required this.onTap,
   this.isSelected = false,
  });


  final String lable;
  final IconData icon;
  final int index;
  final ValueChanged<int> onTap;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon,
            size: 25,
            color: isSelected ? AppColors.accent:null,
            ),
           const SizedBox(height: 8.0),
            Text(lable,
            style: isSelected ? const TextStyle(
              fontSize: 13,
              color: AppColors.accent,
              fontWeight: FontWeight.bold,
    
            ):
            const TextStyle(
              fontSize: 13,
    
            ),
            
            ),
          ],
        ),
      ),
    );
  }
}