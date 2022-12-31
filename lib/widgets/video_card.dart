import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_streaming/models/video_model.dart';
import 'package:video_streaming/views/video_player_view.dart';

class VideoCard extends StatefulWidget {
  final APIVideo apiVideo;
  const VideoCard({Key? key, required this.apiVideo}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerPage(dataSource: widget.apiVideo.link, name: widget.apiVideo.name,)
            ));
      },
      onLongPress: (){
        Clipboard.setData(ClipboardData(text: widget.apiVideo.link)).then((_){
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(const SnackBar(content: Text(("Video link copied to clipboard"))));
            });
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.apiVideo.name, style: TextStyle(color: Theme.of(context).hintColor, fontSize: 18),),
                  IconButton(
                      tooltip: 'Delete',
                      onPressed: () {
                        widget.apiVideo.delete();
                      },
                      icon: const Icon(Icons.delete, color: Colors.red,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
