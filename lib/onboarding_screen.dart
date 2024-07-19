import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Fitness & Wellness",
          body: "Your journey to a healthier lifestyle starts here.",
          image: const Center(child: Icon(Icons.fitness_center, size: 100, color: Colors.blue)),
          decoration:const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "Explore Workout Challenges",
          body: "Participate in various workout challenges and stay fit.",
          image: const Center(child: Icon(Icons.directions_run, size: 100, color: Colors.blue)),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "Track Your Progress",
          body: "Share and track your fitness journey with others.",
          image: const Center(child: Icon(Icons.timeline, size: 100, color: Colors.blue)),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 18),
          ),
        ),
      ],
     onDone: () {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
},

      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done:const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
