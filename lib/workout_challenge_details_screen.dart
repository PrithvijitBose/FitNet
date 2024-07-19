import 'package:flutter/material.dart';
import 'workout challenge.dart';

class WorkoutChallengeDetailsScreen extends StatelessWidget {
  final WorkoutChallenge challenge;

  WorkoutChallengeDetailsScreen({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              challenge.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Exercises:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: challenge.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = challenge.exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text('${exercise.description}\nCalories Burned: ${exercise.caloriesBurned}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
