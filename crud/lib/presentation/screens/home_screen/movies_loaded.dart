import 'package:crud/data/models/movies.dart';
import 'package:crud/presentation/screens/home_screen/widgets/update_movie.dart';
import 'package:flutter/material.dart';

class MoviesLoaded extends StatelessWidget {
  final Movies movies;

  const MoviesLoaded({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView.builder(
            itemCount: movies.movies.length,
            itemBuilder: (context, index) {
              final movie = movies.movies[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      elevation: 1,
                      child: ListTile(
                        title: Text(movie.title),
                        subtitle: Text(movie.body),
                        trailing: Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateMovie(movie: movie)));
                                },
                                icon: const Icon(Icons.edit)),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete_outline)),
                            )
                          ],
                        ),
                      )));
            }));
  }
}
