import 'dart:async';
import 'package:explore/theme.dart';
import 'package:explore/widgets/audio_loading_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerMessage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AudioPlayerMessage({
    required this.source,
    required this.id,
  });

  final AudioSource source;
  final String id;

  @override
  State<AudioPlayerMessage> createState() => _AudioPlayerMessageState();
}

class _AudioPlayerMessageState extends State<AudioPlayerMessage> {
  final _audioPlayer = AudioPlayer();
  late StreamSubscription<PlayerState> _playerStateChangedSubcription;
  late Future<Duration?> futureDuration;

  @override
  void initState(){
    super.initState();

    
    _playerStateChangedSubcription =
        _audioPlayer.playerStateStream.listen(playerStateListener);

    futureDuration = _audioPlayer.setAudioSource(widget.source);

  }

  void playerStateListener(PlayerState state) async {
     if (state.processingState == ProcessingState.completed) {
      await reset();
    }
  }

  
  @override
  void dispose() {
    _playerStateChangedSubcription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       return FutureBuilder<Duration?>(
      future: futureDuration,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _controlButtons(),
              _slider(snapshot.data),
            ],
          );
        }
        return const AudioLoadingMessage();
      },
    );
  }



  Widget _controlButtons() {
    return StreamBuilder<bool>(
      stream: _audioPlayer.playingStream,
      builder: (context, _) {
        final color =
            _audioPlayer.playerState.playing ? AppColors.accent : Colors.blue;
        final icon =
            _audioPlayer.playerState.playing ? Icons.pause : Icons.play_arrow;
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              if (_audioPlayer.playerState.playing) {
                pause();
              } else {
                play();
              }
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(icon, color: color, size: 30),
            ),
          ),
        );
      },
    );
  }

   Widget _slider(Duration? duration) {
    return StreamBuilder<Duration>(
      stream: _audioPlayer.positionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && duration != null) {
          return CupertinoSlider(
            value: snapshot.data!.inMicroseconds / duration.inMicroseconds,
            onChanged: (val) {
              _audioPlayer.seek(duration * val);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );

  }

  
  Future<void> play() {
    return _audioPlayer.play();
  }

  Future<void> pause() {
    return _audioPlayer.pause();
  }

  Future<void> reset() async {
    await _audioPlayer.stop();
    return _audioPlayer.seek(const Duration(milliseconds: 0));
  }

}