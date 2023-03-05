import 'dart:convert';

import 'package:crud/data/data_provider/data_provider.dart';
import 'package:crud/data/models/movies.dart';

class MovieDataRepository {
  final DataProvider _dataProvider = DataProvider();

  Future<Movie> postMovie(String title, String desc) async {
    final String requestBody = jsonEncode({"title": title, "body": desc});
    final String postMovieResponse =
        await _dataProvider.postRequest(_dataProvider.movieDomain, requestBody);
    return Movie.fromJson(json.decode(postMovieResponse));
  }
}
