import 'package:http/http.dart' as http;
import 'package:discover_movie/models/response.dart';
import 'package:discover_movie/models/movie.dart';

Future<Response<Movie>> fetchPopularMovies() async {
  final Map<String, String> queryParameters = {};
  final uri =
      Uri.https('api.themoviedb.org', '3/movie/popular', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Failed to load album');
  }

  return responseFromJson<Movie>(response.body, (x) => Movie.fromJson(x));
}
