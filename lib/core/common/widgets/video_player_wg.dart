import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoController;
  bool _isFullScreen = false;
  bool _isLoading = true;
  bool _hasError = false;
  bool _controlsVisible = true;
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
            _hasError = false;
          });
          _videoController.play();
          _startHideControlsTimer();
        }).catchError((error) {
          setState(() {
            _hasError = true;
          });
        });

      _videoController.addListener(() {
        setState(() {}); // Timeline yangilash
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _controlsVisible = false;
      });
    });
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
      _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play();
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls,
      onDoubleTapDown: (details) {
        if (details.globalPosition.dx < MediaQuery.of(context).size.width / 2) {
          _seekBackward();
        } else {
          _seekForward();
        }
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
                : _videoController.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
                : const CircularProgressIndicator(),
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
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        _formatDuration(_videoController.value.duration),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.replay_10, size: 40, color: Colors.white),
                        onPressed: _seekBackward,
                      ),
                      IconButton(
                        icon: Icon(
                          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                      IconButton(
                        icon: Icon(Icons.forward_10, size: 40, color: Colors.white),
                        onPressed: _seekForward,
                      ),
                      IconButton(
                        icon: Icon(
                          _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                          size: 40,
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
    );
  }
}
