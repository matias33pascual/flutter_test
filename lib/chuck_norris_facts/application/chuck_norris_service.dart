import 'package:http/http.dart' as http;

class ChuckNorrisService {
  final String baseUrl = 'api.chucknorris.io';

  ChuckNorrisService._();

  static final ChuckNorrisService _instance = ChuckNorrisService._();
  static ChuckNorrisService get instance => _instance;

  Future<http.Response> getCategories() async {
    const String categoriesUrl = '/jokes/categories';

    final url = Uri.https(baseUrl, categoriesUrl);

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return response;

        default:
          throw Exception(
              'Error in Chuck Norris Service, getCategories(): ${response.body}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
