import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerWidget extends StatefulWidget {
  final String link;
  const VideoPlayerWidget({Key? key, required this.link}) : super(key: key);
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}
class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  void _initVideoPlayer(String link) async {
    _controller = VideoPlayerController.network(link);
    await _controller.initialize().then((value){
      setState(() {});
    });
    _controller.addListener(() {
      if(_controller.value.position == _controller.value.duration) {
        setState(() {});
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _initVideoPlayer(widget.link);
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    _controller.dispose();
    _initVideoPlayer(widget.link);
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
         width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.7,
            margin: const EdgeInsets.all(AppPadding.s10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_controller),
                if (!_controller.value.isPlaying||
                    _controller.value.position==_controller.value.duration)
                  const Center(
                      child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                ),
                VideoProgressIndicator(_controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.red,
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.grey[700]!,
                    )),
              ],
            ),
          )
        : Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            margin: const EdgeInsets.all(AppPadding.s10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.7,
            color: Colors.grey,
          ),
        );
  }
}