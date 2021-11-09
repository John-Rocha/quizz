import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizz_app/main.dart';
import 'package:quizz_app/utils/utils.dart';

class ResulScreen extends StatefulWidget {
  final int score;
  const ResulScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResulScreenState createState() => _ResulScreenState();
}

class _ResulScreenState extends State<ResulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Congratulations',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'You score is:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 50.0),
            Text(
              "${widget.score}",
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60.0),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              elevation: 0.0,
              color: Colors.orangeAccent,
              textColor: Colors.white,
              child: const Text('Repeat the Quizz'),
            ),
          ],
        ),
      ),
    );
  }
}
