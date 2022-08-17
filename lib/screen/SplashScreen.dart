import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/screen/onBoardingScreen.dart';
import '../main.dart';
import 'BottomNavigationBar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
        const Duration(
          seconds: 5,
        ),
        () {});
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const bottomappbar()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const onBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/amkmusic.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
