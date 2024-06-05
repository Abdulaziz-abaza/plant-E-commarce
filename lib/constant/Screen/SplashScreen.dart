import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flourapp/login/loginview.dart';
import 'package:flourapp/login/registerview.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          duration: 3000,
          splashIconSize: 300,
          splashTransition: SplashTransition.scaleTransition,
          animationDuration: const Duration(milliseconds: 2000),
          // type: AnimatedSplashType.StaticDuration,
          // curve: AnimatedSplashType.StaticDuration,
          splash: Lottie.asset('assets/splash2.json'),
          nextScreen: LoginView()),
    );
  }
}
