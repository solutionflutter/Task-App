import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({Key? key,required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  _VideoPlayScreenState createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController controller;

  loadVideoPlayer(){
    controller = VideoPlayerController.network('${widget.videoUrl}');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){});
    controller.play();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideoPlayer();
    if(mounted){
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child : Center(
            child:  AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width/1.3,
            child: Image(
              image: AssetImage("images/sound_mute_fill.png"),
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width/15,
            )
        ),
        Positioned(
            left: MediaQuery.of(context).size.width/2.8,
            top: MediaQuery.of(context).size.height/10,
            child: Image(
              image: AssetImage("images/Video_fill.png"),
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width/6,
            )
        ),
      ],
    );
  }
}
