import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TypingIndicator({
    this.alternativeWidget,
  });

   final Widget? alternativeWidget;

  @override
  Widget build(BuildContext context) {
    /* final channelState  = StreamChannel.of(context).channel.state!;
    final altWidget = alternativeWidget ?? const SizedBox.shrink(); // if alternative widget is null.
    return BetterStreamBuilder<Iterable<User>>(
      initialData: channelState.typingEvents.keys,
      stream: channelState.typingEventsStream.map((typings) => typings.entries.map((e) => e.key)),
      builder:(context, data) {
        return Align(
          alignment: Alignment.centerLeft,
          child: AnimatedSwitcher(
            duration: const  Duration(milliseconds: 300),
            child: data.isNotEmpty == true
           ? const Align(
              alignment: Alignment.centerLeft,
              key:ValueKey('typing-text'),
              child: Text(
                'Typing message',
                maxLines: 1,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),

              ),
            )
            : Align(
              alignment: Alignment.centerLeft,
              key: const ValueKey('altWidget'),
              child: altWidget
              ),
            
          ),
        );
      },

    ); */

    return Text('');
    
  }
}