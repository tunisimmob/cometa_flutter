import 'package:chewie/chewie.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String titre;
  VideoPlayerScreen({Key key, this.videoUrl, this.titre}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerScreenState();
  }
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  // VideoPlayerController _oldvideoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    if (mounted)
      setState(() {
        _videoPlayerController1 = null;
      });
    _videoPlayerController1 = VideoPlayerController.network(widget.videoUrl);
    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      placeholder: Container(
        color: Colors.white,
      ),
      autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // width: ResponsiveFlutter.of(context).wp(95),
          padding: EdgeInsets.all(5),
          color: Consts.maincolor,
          child: Center(
            child: Text(
              widget.titre,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: ResponsiveFlutter.of(context).hp(35),
          child: _chewieController != null &&
                  _chewieController.videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: _chewieController,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(height: 20),
                    Text('Chargement en cours'),
                  ],
                ),
        ),
      ],
    );
  }
}
