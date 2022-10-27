import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class UnreadIndicator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
 // const UnreadIndicator({required this.channel});
  const UnreadIndicator({Key? key}) : super(key: key);

  // final Channel channel;

  @override
  Widget build(BuildContext context) {
    /* return IgnorePointer(
      child: BetterStreamBuilder<int>(
        stream:channel.state!.unreadCountStream,
        initialData:channel.state!.unreadCount,
        builder: (context,data){ 
        if (data == 0){
          return const SizedBox.shrink();
        }
        return Material(
          borderRadius: BorderRadius.circular(8),
          color:AppColors.accent,
          child: Padding(
            padding: const EdgeInsets.only(
              top:2.0,
              bottom:1.0,
              left:5.0,
              right:5.0,
            ),
            child: Center(
              child: Text(
                '${data > 99 ? '99+' :data }',
                style: const TextStyle(
                  color:Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        );
        },
      ),
    ); */

      return Material(
          borderRadius: BorderRadius.circular(8),
          color:AppColors.accent,
          child: const Padding(
            padding:  EdgeInsets.only(
              top:2.0,
              bottom:1.0,
              left:5.0,
              right:5.0,
            ),
            child: Center(
              child: Text(
               '1',
                style:  TextStyle(
                  color:Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          )
      );

  }
}