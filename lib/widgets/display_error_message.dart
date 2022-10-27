
import 'package:flutter/material.dart';

class DisplayErrorMessage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DisplayErrorMessage({
    this.error,
  });

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Oh no,Something went wrong.'
        'Please check your connection on your device.$error',// it prints the error
        )
    );
  }
}


