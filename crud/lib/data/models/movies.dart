class Movie {
  int id;
  String title;
  String body;

  Movie({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Movies {
  List<Movie> movies;

  Movies({required this.movies});

  factory Movies.fromJson(List<dynamic> json) {
    List<Movie> movies = [];
    movies = json.map((movie) => Movie.fromJson(movie)).toList();
    return Movies(movies: movies);
  }
}
