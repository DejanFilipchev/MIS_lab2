
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_203098/screens/screen_for_jokes.dart';

class JokeCard extends StatelessWidget {
  final String type;

  const JokeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      color: Colors.redAccent[100],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenForJokes(type: type),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 50,
                color:  Colors.redAccent[100],
              ),
              const SizedBox(height: 10),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}