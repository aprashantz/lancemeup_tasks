import 'package:crud/business_logic/crud_bloc/crud_bloc.dart';
import 'package:crud/constants/text.dart';
import 'package:crud/presentation/screens/home_screen/movies_loaded.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ViewMovies extends StatelessWidget {
  const ViewMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final crudBloc = Provider.of<CRUDBloc>(context);
    final state = crudBloc.state;
    if (state is OperationLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MoviesFetchedState) {
      return MoviesLoaded(movies: state.movies);
    } else if (state is OperationFailure) {
      Fluttertoast.showToast(msg: errorMsg);
    } else if (state is MovieUpdatedState) {
      Fluttertoast.showToast(
          msg: "${state.titleOfUpdatedMovie} has been updated.");
    } else if (state is MovieDeletedState) {
      Fluttertoast.showToast(msg: "Successfully deleted");
    }
    // auto trigging FetchMoviesEvent as movies needs to be auto shown in this page.
    crudBloc.add(FetchMoviesEvent());
    // below content to show if network or any error occurs and movies are not auto fetched
    return Material(
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  crudBloc.add(FetchMoviesEvent());
                },
                child: const Text("View Movies"))));
  }
}
