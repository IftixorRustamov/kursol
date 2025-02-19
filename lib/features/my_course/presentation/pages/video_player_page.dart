import 'package:flutter/material.dart';
import 'package:kursol/core/common/widgets/video_player_wg.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerPage({super.key, required this.videoUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: CustomVideoPlayer(videoUrl: videoUrl),
      ),
    );
  }
}
