import 'dart:convert';
import 'package:crud/data/data_provider/data_provider.dart';
import 'package:crud/data/models/movies.dart';
import 'package:http/http.dart';

class MovieDataRepository {
  final DataProvider _dataProvider = DataProvider();

  Future<Movie> postMovie(String title, String desc) async {
    final String requestBody = jsonEncode({"title": title, "body": desc});
    final String postMovieResponse =
        await _dataProvider.postRequest(_dataProvider.movieDomain, requestBody);
    return Movie.fromJson(json.decode(postMovieResponse));
  }

  Future<Movies> fetchMovies() async {
    return Movies.fromJson(json.decode(await _dataProvider.getRequest()));
  }

  Future<Movie> updateMovie(int movieId, String title, String desc) async {
    final String requestBody = jsonEncode({"title": title, "body": desc});
    final String updateMovieResp =
        await _dataProvider.patchRequest(movieId, requestBody);
    return Movie.fromJson(json.decode(updateMovieResp));
  }

  Future<bool> deleteMovie(int movieId) async {
    Response rawResp = await _dataProvider.deleterequest(movieId);
    return rawResp.statusCode == 200;
  }
}
