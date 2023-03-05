import 'dart:async';

import 'package:bloc/bloc.dart';
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
  }

  void _initialEvent(InitialCRUDEvent initialEvent, Emitter<CRUDState> emit) {
    emit.call(InitialState());
  }

  FutureOr<void> _addMovie(
      AddMovieEvent addMovieEvent, Emitter<CRUDState> emit) async {
    emit.call(OperationLoading());
    // try {
    Movie addMovieResponse = await _movieDataRepository.postMovie(
        addMovieEvent.title, addMovieEvent.description);
    emit.call(OperationSuccess(postedMovie: addMovieResponse));
  }
  // catch (e) {
  //   emit.call(OperationFailure(msg: "Server down or no internet."));
  // }
}
// }
