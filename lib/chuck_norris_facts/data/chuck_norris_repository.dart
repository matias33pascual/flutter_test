import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/utils/utils.dart';

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
}
