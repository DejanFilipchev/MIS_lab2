import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_203098/services/api_service.dart';
import 'package:lab2_203098/widgets/cards.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<String>> joke_types;

  @override
  void initState() {
    super.initState();
    joke_types = ApiService().getJokeTypesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lab2_203098'),
        backgroundColor: Colors.redAccent[100],
      ),
      body: FutureBuilder<List<String>>(
        future: joke_types,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const Center(child: Text('No joke types available'));
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => JokeCard(type: data[index]),
          );
        },
      ),
    );
  }
}
