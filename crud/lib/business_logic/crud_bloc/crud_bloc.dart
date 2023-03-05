import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crud/constants/text.dart';
import 'package:crud/data/data_repository/crud_repository.dart';
import 'package:crud/data/models/movies.dart';
import 'package:equatable/equatable.dart';
part 'crud_event.dart';
part 'crud_state.dart';

class CRUDBloc extends Bloc<CRUDEvent, CRUDState> {
  final MovieDataRepository _movieDataRepository = MovieDataRepository();
  CRUDBloc() : super(InitialState()) {
    on<InitialCRUDEvent>(_initialEvent);
    on<AddMovieEvent>(_addMovie);
    on<FetchMoviesEvent>(_fetchMovies);
    on<UpdateMovieEvent>(_updateMovie);
    on<DeleteMovieEvent>(_deleteMovie);
  }

  void _initialEvent(InitialCRUDEvent initialEvent, Emitter<CRUDState> emit) {
    emit.call(InitialState());
  }

  FutureOr<void> _addMovie(
      AddMovieEvent addMovieEvent, Emitter<CRUDState> emit) async {
    emit.call(OperationLoading());
    try {
      Movie addMovieResponse = await _movieDataRepository.postMovie(
          addMovieEvent.title, addMovieEvent.description);
      emit.call(OperationSuccess(postedMovie: addMovieResponse));
    } catch (e) {
      emit.call(OperationFailure(msg: errorMsg));
    }
  }

  FutureOr<void> _fetchMovies(
      FetchMoviesEvent fetchMoviesEvent, Emitter<CRUDState> emit) async {
    emit.call(OperationLoading());
    try {
      Movies movies = await _movieDataRepository.fetchMovies();
      emit.call(MoviesFetchedState(movies: movies));
    } catch (e) {
      emit.call(OperationFailure(msg: errorMsg));
    }
  }

  FutureOr<void> _updateMovie(
      UpdateMovieEvent updateMovieEvent, Emitter<CRUDState> emit) async {
    emit.call(OperationLoading());
    try {
      Movie movie = await _movieDataRepository.updateMovie(
          updateMovieEvent.movieId,
          updateMovieEvent.title,
          updateMovieEvent.description);
      emit.call(MovieUpdatedState(titleOfUpdatedMovie: movie.title));
    } catch (e) {
      emit.call(OperationFailure(msg: errorMsg));
    }
  }

  FutureOr<void> _deleteMovie(
      DeleteMovieEvent deleteMovieEvent, Emitter<CRUDState> emit) async {
    emit.call(OperationLoading());
    try {
      bool isDeleted =
          await _movieDataRepository.deleteMovie(deleteMovieEvent.movieId);
      isDeleted
          ? emit.call(MovieDeletedState())
          : emit.call(OperationFailure(msg: errorMsg));
    } catch (e) {
      emit.call(OperationFailure(msg: errorMsg));
    }
  }
}
