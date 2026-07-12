import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'routes_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/Video/Splash.mp4',
    );


    _controller.initialize().then((value) {

      setState(() {});

      _controller.play();


      _controller.addListener(() {

        if (_controller.value.position >=
            _controller.value.duration) {


          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RoutesScreen(),
            ),
          );


        }

      });


    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 232, 231, 233),

      body: Center(

        child: _controller.value.isInitialized

            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )

            : const CircularProgressIndicator(),

      ),

    );

  }



  @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }

}