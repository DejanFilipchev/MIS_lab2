import 'package:flutter/material.dart';
import 'package:lab2_203098/services/api_service.dart';

import '../models/jokes-model.dart';

class ScreenForJokes extends StatefulWidget {
  final String type;

  const ScreenForJokes({super.key, required this.type});

  @override
  State<ScreenForJokes> createState() => _ScreenForJokesState();
}

class _ScreenForJokesState extends State<ScreenForJokes> {
  late Future<List<Joke>> jokes;
  @override
  void initState(){
    super.initState();
    jokes = ApiService().getJokesByType(widget.type);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
        backgroundColor: Colors.redAccent[100],
      ),
      body: FutureBuilder<List<Joke>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const Center(child: Text('No jokes available'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final joke = data[index];
              return ListTile(
                title: Text(joke.setup),
                subtitle: Text(joke.punchline),
              );
            },
          );
        },
      ),
    );
  }
}
