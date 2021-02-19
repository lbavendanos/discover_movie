import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:discover_movie/models/response.dart';
import 'package:discover_movie/models/movie.dart';

Future<Response<Movie>> fetchPopularMovies() async {
  String apiKey = env['API_KEY'];
  String apiDomain = env['API_DOMAIN'];

  final Map<String, String> queryParameters = {
    'api_key': apiKey,
    'language': 'en-US',
    'page': '1',
  };
  final uri = Uri.https(apiDomain, '3/movie/popular', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Failed to load album');
  }

  return responseFromJson<Movie>(response.body, (x) => Movie.fromJson(x));
}
