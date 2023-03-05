import 'package:crud/business_logic/crud_bloc/crud_bloc.dart';
import 'package:crud/data/models/movies.dart';
import 'package:crud/presentation/screens/home_screen/widgets/update_movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesLoaded extends StatelessWidget {
  final Movies movies;

  const MoviesLoaded({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final crudBloc = Provider.of<CRUDBloc>(context);
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
                        leading: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateMovie(movie: movie)));
                            },
                            icon: const Icon(Icons.edit)),
                        title: Text(movie.title,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        subtitle: Text(movie.body,
                            maxLines: 3, overflow: TextOverflow.ellipsis),
                        trailing: IconButton(
                            onPressed: () async {
                              crudBloc.add(DeleteMovieEvent(movieId: movie.id));
                            },
                            icon: const Icon(Icons.delete_outline)),
                      )));
            }));
  }
}
