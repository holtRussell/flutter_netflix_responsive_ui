import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  final String videoURL;
  const PlayVideoScreen({Key key, this.videoURL}) : super(key: key);

  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.videoURL)..play();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hi'),
    );
  }
}
