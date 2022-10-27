/* 
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';


/// widget that build itself based on the latest snapshot of interaction with
/// a [Stream] of type [ConnectionStatus]
/// 
/// The widget will use the closest [StreamChatClient.wsConnectionStatusStream]
/// In case there is no stream provided.

class ConnectionStatusBuilder extends StatelessWidget {
  // create a new connectionstatusbuiler widget
  // ignore: use_key_in_widget_constructors
  const ConnectionStatusBuilder({
    Key?key,
     required this.statusBuilder,
     this.connectionStatusStream,
    this.loadingBuilder,
    this.errorBuilder,
  }):super(key: key);

// The asynchronous computation to which this builder is currently connected.
  final Stream<ConnectionStatus>? connectionStatusStream;

// The builder that will be used in case of error
  final Widget Function(BuildContext context, Object? error) ? errorBuilder;

  // The builder that will be used in case of loading
  final WidgetBuilder? loadingBuilder;

  // The builder that will be used in case of data
  final Widget Function(BuildContext context, ConnectionStatus status) statusBuilder;


  @override
  Widget build(BuildContext context) {
    final stream = connectionStatusStream ?? StreamChatCore.of(context).client.wsConnectionStatusStream;
    final client = StreamChatCore.of(context).client;
    return BetterStreamBuilder<ConnectionStatus>(
      initialData: client.wsConnectionStatus,
      stream:stream,
      noDataBuilder: loadingBuilder,
      errorBuilder: (context, error){
        if(errorBuilder != null){
          return errorBuilder!(context, error);
        }
        return const Offstage();
      },
      builder: statusBuilder,

    );

  }
} */