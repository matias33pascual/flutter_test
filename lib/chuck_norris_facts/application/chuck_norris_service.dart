import 'package:http/http.dart' as http;

class ChuckNorrisService {
  final String _baseUrl = 'api.chucknorris.io';

  ChuckNorrisService._();

  static final ChuckNorrisService _instance = ChuckNorrisService._();
  static ChuckNorrisService get instance => _instance;

  Future<http.Response> getCategories() async {
    const String endpoint = '/jokes/categories';

    final url = Uri.https(_baseUrl, endpoint);

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return response;

        default:
          throw Exception(
              'Error in Chuck Norris Service. getCategories: ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<http.Response> getRandomFromCategory(String category) async {
    const String endpoint = '/jokes/random';

    final url = Uri.https(_baseUrl, endpoint, {'category': category});

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return response;

        default:
          throw Exception(
              'Error in Chuck Norris Service. getRandomFromCategory: ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<http.Response> getRandomJoke() async {
    const String endpoint = '/jokes/random';

    final url = Uri.https(_baseUrl, endpoint);

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return response;

        default:
          throw Exception(
              'Error in Chuck Norris Service. getRandomJoke: ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
