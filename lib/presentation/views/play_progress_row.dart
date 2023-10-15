import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayProgressRow extends StatefulWidget {
  const PlayProgressRow({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<PlayProgressRow> createState() => _PlayProgressRowState();
}

class _PlayProgressRowState extends State<PlayProgressRow> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            setState(() => widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play());
          },
          icon: Icon(
            widget.controller.value.isPlaying
                ? Icons.pause_circle_outline
                : Icons.play_circle_outline_sharp,
          )),
      Expanded(
        child: VideoProgressIndicator(
          widget.controller,
          allowScrubbing: widget.controller.value.isBuffering,
          colors: const VideoProgressColors(
              bufferedColor: Colors.grey,
              playedColor: Colors.white,
              backgroundColor: Colors.blueGrey),
        ),
      ),
      IconButton(
          onPressed: () {
            setState(() => widget.controller.value.volume == 0
                ? widget.controller.setVolume(1)
                : widget.controller.setVolume(0));
          },
          icon: Icon(
            widget.controller.value.volume == 0 ? Icons.volume_mute : Icons.volume_up,
          )),
    ]);
  }
}
