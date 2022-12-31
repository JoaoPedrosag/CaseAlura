import 'package:case_alura/core/widgets/button/button_custom.dart';
import 'package:case_alura/core/widgets/text/text_custom.dart';
import 'package:case_alura/modules/movies/controller/play_video/play_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoPage extends StatefulWidget {
  const WatchVideoPage({super.key});

  @override
  State<WatchVideoPage> createState() => _WatchVideoPageState();
}

class _WatchVideoPageState extends State<WatchVideoPage> {
  final controllerwatch = Modular.get<PlayVideoController>();

  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void dispose() {
    super.dispose();
    controllerwatch.setKey('');
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    _controller = YoutubePlayerController(
      initialVideoId: controllerwatch.key,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              Modular.to.pop();
            },
          ),
          backgroundColor: Colors.yellow,
          title: const Text('Assista o Trailer',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // some widgets
            player,
            GestureDetector(
              onTap: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                ]);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[890],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey[200]!),
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/rotate_screen.json',
                          repeat: true,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8),
                      const TextCustom(
                        label: 'Gire o celular ou clique para girar sua tela',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: ButtonCustom(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.yellow,
                  label: const Text('Voltar',
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                    Modular.to.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
