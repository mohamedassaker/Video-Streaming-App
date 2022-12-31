import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String dataSource;
  final String name;
  const VideoPlayerPage({Key? key, required this.dataSource, required this.name}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.dataSource)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).hintColor,
          title: Text(widget.name, style: TextStyle(color: Theme.of(context).primaryColor),),
          leading: BackButton(color: Theme.of(context).primaryColor,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _controller.value.isInitialized ?
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Theme.of(context).hintColor,
              ),
            ),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: const EdgeInsets.only(bottom: 13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Theme.of(context).hintColor,),
                  onPressed: (){
                    setState(() {
                      _controller.setPlaybackSpeed(_controller.value.playbackSpeed-0.5);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Theme.of(context).hintColor,),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Theme.of(context).hintColor,),
                  onPressed: (){
                    setState(() {
                      _controller.setPlaybackSpeed(_controller.value.playbackSpeed+0.5);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("x${_controller.value.playbackSpeed}", style: TextStyle(color: Theme.of(context).hintColor),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Theme.of(context).hintColor,),
                  onPressed: (){
                    setState(() {
                      _controller.setVolume(_controller.value.volume-1);
                    });
                  },
                ),
                Text("Volume", style: TextStyle(color: Theme.of(context).hintColor)),
                IconButton(
                  icon: Icon(Icons.add, color: Theme.of(context).hintColor,),
                  onPressed: (){
                    setState(() {
                      _controller.setVolume(_controller.value.volume+1);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
