import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  final String videoURL;
  const PlayVideoScreen({Key key, this.videoURL}) : super(key: key);

  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  TextEditingController textController;
  VideoPlayerController controller;

  @override
  void initState() {
    textController = TextEditingController(text: widget.videoURL);
    controller = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4')
      ..addListener(() => setState(() {}))
      ..initialize().then((_) => setState(() => controller.play()));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: controller.value.isInitialized
              ? VideoPlayer(controller)
              : SizedBox(
                  height: 1.0,
                ),
        ),
      ),
    );
  }
}
