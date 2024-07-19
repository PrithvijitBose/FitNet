import 'package:flutter/material.dart';
import 'theme.dart'; // Import your custom theme
import 'package:shared_preferences/shared_preferences.dart'; // Import for using SharedPreferences

class ProgressSharingScreen extends StatefulWidget {
  @override
  _ProgressSharingScreenState createState() => _ProgressSharingScreenState();
}

class _ProgressSharingScreenState extends State<ProgressSharingScreen> {
  TextEditingController _progressController = TextEditingController();
  List<String> progressUpdates = [];
  final AssetImage _selectedImage = AssetImage('assets/image1.png'); // Load image from assets

  @override
  void initState() {
    super.initState();
    _loadProgressUpdates();
  }

  void _loadProgressUpdates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedUpdates = prefs.getStringList('progressUpdates');
    if (savedUpdates != null) {
      setState(() {
        progressUpdates = savedUpdates;
      });
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _saveProgressUpdate(String progressUpdate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    progressUpdates.add(progressUpdate);
    await prefs.setStringList('progressUpdates', progressUpdates);
    _progressController.clear();
    setState(() {});
  }

  void _clearProgressUpdates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('progressUpdates');
    setState(() {
      progressUpdates.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Sharing'),
        backgroundColor: AppTheme.primarySwatchColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Share Your Progress',
              style: AppTheme.headlineTextStyle,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _progressController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter your progress update...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String progressUpdate = _progressController.text;
                if (progressUpdate.isNotEmpty) {
                  _saveProgressUpdate(progressUpdate);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter your progress update.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Share'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 255, 0),
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            _buildProgressUpdates(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _clearProgressUpdates,
                child: const Text('Clear Progress'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppTheme.backgroundColor,
    );
  }

  Widget _buildProgressUpdates() {
    return ListView.builder(
      shrinkWrap: true, // Ensures the ListView takes only the necessary space
      physics: NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
      itemCount: progressUpdates.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(progressUpdates[index]),
            leading: CircleAvatar(backgroundImage: _selectedImage),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  progressUpdates.removeAt(index);
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setStringList('progressUpdates', progressUpdates);
                  });
                });
              },
            ),
          ),
        );
      },
    );
  }
}
