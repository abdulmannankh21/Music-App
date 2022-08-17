import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:musicapp/screen/SignUp.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: [
          PageViewModel(
            title: "",
            image: Image.asset("assets/onBoard1.png"),
            decoration: PageDecoration(
              bodyPadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.only(top: 100, left: 20, right: 20),
            ),
            bodyWidget: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ELECTRIC GUITAR",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "A pure amplification of the strings \(that can provide a sound similar to an acoustic guitar\) to the distorted electronic sounds found in some heavy metal or rock music.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      wordSpacing: 3,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "",
            image: Image.asset("assets/onBoard2.png"),
            decoration: PageDecoration(
              bodyPadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.only(top: 100, left: 20, right: 20),
            ),
            bodyWidget: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DRUM BEAT",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Bright, hard, clear, precise, metallic, shrill, noise-like, sharp, penetrating, rustling, hissing, shuffling, rattling, clattering, dry, cracking.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      wordSpacing: 3,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "",
            image: Image.asset("assets/onBoard3.png"),
            decoration: PageDecoration(
              bodyPadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.only(top: 100, left: 20, right: 20),
            ),
            bodyWidget: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GUITAR",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The sound of the guitar is projected either acoustically, by means of a resonant chamber on the instrument, or amplified by an electronic pickup and an amplifier.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      wordSpacing: 3,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        onDone: () {
          // When done button is press
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SignUp(),
            ),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
          onChange:
          () {};
        },
        showBackButton: false,
        showSkipButton: false,
        showNextButton: true,
        done: Container(
            height: size.height * 0.03,
            child: Center(
                child: const Text("Get Started",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.amber)))),
        next: Container(
            height: size.height * 0.03,
            child: Center(
                child: const Text("Skip",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.amber)))),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.white.withOpacity(0.4),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeColor: Colors.amber),
      ),
    );
  }
}
