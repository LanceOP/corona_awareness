import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoBox extends StatefulWidget {
  final videoId;

  VideoBox({this.videoId});
  @override
  _VideoBoxState createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  YoutubePlayerController _controller;
  //Future<void> futureController;

  @override
  void initState() {
    super.initState();
    _controller =YoutubePlayerController(
        initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop:true,
      ),
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Prevention'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         //   Image.network('https://newsroom.clevelandclinic.org/wp-content/uploads/sites/4/2020/03/Prevention-graphic_cloth-mask-update_04_07_20-1536x1104.jpg'),
           YoutubePlayer(
             controller: _controller,
            showVideoProgressIndicator: true,
             progressIndicatorColor: Colors.red,
           ),
          ],
        ),
      ),
    );
  }
}
