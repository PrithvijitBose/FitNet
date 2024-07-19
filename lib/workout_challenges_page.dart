import 'package:flutter/material.dart';
import 'theme.dart'; // Import your custom theme
import 'workout challenge.dart'; // Import your WorkoutChallenge model
import 'abs_challenge_screen.dart';
import 'push_up_challenge_screen.dart';
import 'cardio_blast_challenge_screen.dart';
import 'exercise.dart';

 // Import the new screens

class WorkoutChallengesScreen extends StatelessWidget {
  // Example list of workout challenges (replace with your actual data)
  final List<WorkoutChallenge> workoutChallenges = [
    WorkoutChallenge(
      title: '30-Day Ab Challenge',
      description: 'Get stronger and more defined abs in just 30 days!',
      exercises: [
      Exercise(name: 'Crunches', description: 'Do 3 sets of 15 reps', caloriesBurned: 16),
      Exercise(name: 'Plank', description: 'Hold for 1 minute', caloriesBurned: 4),
      Exercise(name: 'Russian Twists', description: 'Do 3 sets of 15 reps', caloriesBurned: 15),
      Exercise(name: 'Leg Raises', description: 'Perform 15 leg raises', caloriesBurned: 12),
    ],
  ),
  WorkoutChallenge(
    title: 'Push-Up Challenge',
    description: 'Improve your upper body strength with this 14-day challenge.',
    exercises: [
      Exercise(name: 'Push-Ups', description: 'Do 3 sets of 10 reps', caloriesBurned: 16),
      Exercise(name: 'Wide Push-Ups', description: 'Do 3 sets of 10 reps', caloriesBurned: 21),
      Exercise(name: 'Diamond Push-Ups', description: 'Do 3 sets of 10 reps', caloriesBurned: 20),
      Exercise(name: 'Incline Push-Ups', description: 'Do 3 sets of 10 reps', caloriesBurned: 18),
    ],
  ),
  WorkoutChallenge(
    title: 'Cardio Blast Challenge',
    description: 'Boost your cardiovascular endurance with intense cardio workouts.',
    exercises: [
      Exercise(name: 'Jumping Jacks', description: 'Do 3 sets of 30 reps', caloriesBurned: 30),
      Exercise(name: 'Burpees', description: 'Do 3 sets of 15 reps', caloriesBurned: 45),
      Exercise(name: 'High Knees', description: 'Do 3 sets of 1 minute', caloriesBurned: 40),
      Exercise(name: 'Mountain Climbers', description: 'Do 3 sets of 30 reps', caloriesBurned: 35),
    ],
  ),
  // Add more challenges as needed
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Challenges'),
        backgroundColor: AppTheme.primarySwatchColor,
      ),
      body: ListView.builder(
        itemCount: workoutChallenges.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              workoutChallenges[index].title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppTheme.textColor,
              ),
            ),
            subtitle: Text(
              workoutChallenges[index].description,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: AppTheme.textColor.withOpacity(0.8),
              ),
            ),
            onTap: () {
              Widget screen;
              switch (workoutChallenges[index].title) {
                case '30-Day Ab Challenge':
                  screen = AbsChallengeScreen(challenge: workoutChallenges[index]);
                  break;
                case 'Push-Up Challenge':
                  screen = PushUpChallengeScreen(challenge: workoutChallenges[index]);
                  break;
                case 'Cardio Blast Challenge':
                  screen = CardioBlastChallengeScreen(challenge: workoutChallenges[index]);
                  break;
                default:
                  screen = AbsChallengeScreen(challenge: workoutChallenges[index]); // Default screen
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            },
          );
        },
      ),
      backgroundColor: AppTheme.backgroundColor,
    );
  }
}
