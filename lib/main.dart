import 'package:flutter/material.dart'; // Import your custom theme
import 'workout challenge.dart'; // Import your WorkoutChallenge model
import 'abs_challenge_screen.dart';
import 'push_up_challenge_screen.dart';
import 'cardio_blast_challenge_screen.dart';
import 'home_page.dart';
import 'onboarding_screen.dart';
import 'progress_sharing_page.dart';
import 'workout_challenges_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness & Wellness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(), // Set OnboardingScreen as the initial screen
      routes: {
        '/home': (context) => HomePage(),
        '/workoutChallenges': (context) => WorkoutChallengesScreen(),
        '/progressSharing': (context) => ProgressSharingScreen(),
        '/absChallenge': (context) => AbsChallengeScreen(challenge: ModalRoute.of(context)!.settings.arguments as WorkoutChallenge), // Pass WorkoutChallenge data
        '/pushUpChallenge': (context) => PushUpChallengeScreen(challenge: ModalRoute.of(context)!.settings.arguments as WorkoutChallenge), // Pass WorkoutChallenge data
        '/cardioBlastChallenge': (context) => CardioBlastChallengeScreen(challenge: ModalRoute.of(context)!.settings.arguments as WorkoutChallenge), // Pass WorkoutChallenge data
      },
    );
  }
}
