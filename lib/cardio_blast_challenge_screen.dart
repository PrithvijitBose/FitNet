import 'package:flutter/material.dart';
import 'workout challenge.dart'; // Import your WorkoutChallenge model

class CardioBlastChallengeScreen extends StatefulWidget {
  final WorkoutChallenge challenge;

  CardioBlastChallengeScreen({required this.challenge});

  @override
  _CardioBlastChallengeScreenState createState() => _CardioBlastChallengeScreenState();
}

class _CardioBlastChallengeScreenState extends State<CardioBlastChallengeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.challenge.title),
        backgroundColor: Colors.greenAccent, // Custom color for app bar
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: _offsetAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green[50]!, Colors.white],
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      widget.challenge.description,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Exercises:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.challenge.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = widget.challenge.exercises[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              exercise.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text(
                                  exercise.description,
                                  style: TextStyle(color: Colors.black87),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Calories Burned: ${exercise.caloriesBurned}',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
