import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/jokes-model.dart';

class ApiService{

  Future<List<String>> getJokeTypesApi() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));
    if (response.statusCode == 200) {
      List<String> types = List<String>.from(json.decode(response.body));
      return types;
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/${type}/ten"));
    if (response.statusCode == 200) {
      List<dynamic> jokes_json = json.decode(response.body);
      return jokes_json.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception('Run Time Error, try again later');
    }
  }
}
