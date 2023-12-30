import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:languagelearningapp/screens/home_screen.dart'; // homeScreen.dart dosyasını ekledik

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()), // HomeScreen'e git
            );
          },
        ),
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000),
          const Text(
            'Your Score: ',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / 9,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / questions.length * 100).round()}%',
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
