// ==================== IMPORTS ====================
import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/MainScreen.dart';
import 'package:rihla_4_0/screens/loginpage.dart';
import '../services/session_services.dart';
import 'package:video_player/video_player.dart';
import 'routes_screen.dart';

// ==================== SPLASH WIDGET (Stateful) ====================
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

// ==================== SPLASH STATE ====================
class _SplashState extends State<Splash> {
  // ---- PROPERTIES ----
  late VideoPlayerController _controller; // Video player controller

  // ---- LIFECYCLE: INIT STATE ----
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/Video/Splash2.mp4');

    // Step 2: After initialization completes
    _controller.initialize().then((value) {
      setState(() {}); // Trigger rebuild to show video

      _controller.play(); // Start playing

      // Step 3: Add listener for video progress
      _controller.addListener(() async {
        // Step 4: Check if video reached the end
        if (_controller.value.position >= _controller.value.duration) {
          // Step 5: Check login status
          bool loggedIn = await SessionService.isLoggedIn();

          // Step 6: Navigate based on login status
          if (loggedIn) {
            // CASE A: User is logged in → Go to MainScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else {
            // CASE B: User is NOT logged in → Go to Loginpage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()),
            );
          }
        }
      });
    });
  }

  // ---- LIFECYCLE: BUILD ----
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF122E64), // Dark blue background
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                // Show video when ready
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(), // Show loader while initializing
      ),
    );
  }

  // ---- LIFECYCLE: DISPOSE ----
  @override
  void dispose() {
    _controller.dispose(); // Clean up video player resources
    super.dispose();
  }
}
