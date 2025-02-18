import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerPage({super.key, required this.videoUrl, required this.title});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoController;
  bool _isFullScreen = false;
  bool _isLoading = true;
  bool _hasError = false;
  bool _controlsVisible = false;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
        ..initialize().then((_) {
          setState(() {
            _isLoading = false;
          });
          _videoController.play();
          _startHideControlsTimer();
        }).catchError((error) {
          setState(() {
            _hasError = true;
          });
        });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _controlsVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  void _toggleControls() {
    setState(() {
      _controlsVisible = !_controlsVisible;
    });
    if (_controlsVisible) {
      _startHideControlsTimer();
    }
  }

  void _togglePlayPause() {
    setState(() {
      _videoController.value.isPlaying ? _videoController.pause() : _videoController.play();
    });
    _startHideControlsTimer();
  }

  void _seekForward() {
    final newPosition = _videoController.value.position + const Duration(seconds: 10);
    _videoController.seekTo(newPosition);
  }

  void _seekBackward() {
    final newPosition = _videoController.value.position - const Duration(seconds: 10);
    _videoController.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _isFullScreen
          ? null
          : AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: _toggleControls,
        onDoubleTapDown: (details) {
          if (details.globalPosition.dx < screenWidth / 2) {
            _seekBackward();
          } else {
            _seekForward();
          }
        },
        onLongPressStart: (details) {
          if (details.globalPosition.dx < screenWidth / 2) {
            _videoController.setPlaybackSpeed(0.5);
          } else {
            _videoController.setPlaybackSpeed(2.0);
          }
        },
        onLongPressEnd: (_) {
          _videoController.setPlaybackSpeed(1.0);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: _hasError
                  ? const Text(
                "Video yuklanmadi. Iltimos, internetni tekshiring!",
                style: TextStyle(color: Colors.white),
              )
                  : _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            ),
            if (_controlsVisible)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    VideoProgressIndicator(
                      _videoController,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: AppColors.blue,
                        bufferedColor: Colors.grey,
                        backgroundColor: Colors.white30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_videoController.value.position),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          _formatDuration(_videoController.value.duration),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            _videoController.value.isPlaying ? IconlyLight.play : IconlyBold.play,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: _togglePlayPause,
                        ),
                        IconButton(
                          icon: ImageIcon(
                            AssetImage(_isFullScreen ? 'assets/images/full_screen.png' : 'assets/images/full_screen.png'),
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: _toggleFullScreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
