import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/utils/utils.dart';

import '../domain/joke.dart';

class ChuckNorrisRepository {
  ChuckNorrisService service;

  ChuckNorrisRepository({required this.service});

  Future<List<String>> getCategories() async {
    try {
      final response = await service.getCategories();

      return parseStringArrayToListString(response.body);
    } catch (error) {
      return [];
    }
  }

  Future<Joke> getJoke() async {
    try {
      final response = await service.getRandomJoke();

      return Joke.fromJson(response.body);
    } catch (error) {
      rethrow;
    }
  }

  Future<Joke> getJokeFromCategory(String category) async {
    try {
      final response = await service.getRandomFromCategory(category);

      return Joke.fromJson(response.body);
    } catch (error) {
      rethrow;
    }
  }
}
