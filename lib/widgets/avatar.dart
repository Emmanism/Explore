import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  const Avatar({
    Key?key,
      this.url,
     required this.radius,
      this.onTap,
      required this.size
     }):super(key: key);

  const Avatar.small({
    Key?key,
       this.url,
      this.onTap,
     }): radius = 18,
     size = 28,
     super(key: key);

  const Avatar.medium({
    Key?key,
    this.url,
     this.onTap,
     }): radius = 25,
     size = 35,
     super(key: key);

  const Avatar.large({
    Key?key,
      this.url,
      this.onTap,
     }): radius = 54,
     size = 45,
     super(key: key);

     final double radius;
     final String? url;
     final VoidCallback? onTap;
     final double size;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: _avatar(context)
      );
  }
  
  Widget _avatar(BuildContext context) {
      if(url != null){
     return CircleAvatar(
      radius:radius,
      backgroundImage: CachedNetworkImageProvider(url!),
      backgroundColor: Theme.of(context).cardColor,

    );
   } else{
    return CircleAvatar(
      radius:radius,
      backgroundColor: Theme.of(context).cardColor,
      child:Icon(
        CupertinoIcons.person_fill,
       // color:Colors.white,
        size:size
      )
      
    );
   } /* else{
     return CircleAvatar(
      radius:radius,
      backgroundColor: Theme.of(context).cardColor,
      child: Text(
        '?',
        style: TextStyle(
          fontSize: radius,
        )
      ),
    );
   

   }  */
  }
}