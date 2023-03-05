part of 'crud_bloc.dart';

abstract class CRUDState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CRUDState {}

class OperationLoading extends CRUDState {}

class MoviesFetchedState extends CRUDState {
  final Movies movies;
  MoviesFetchedState({required this.movies});
  @override
  List<Object?> get props => [movies];
}

// for updating existing movie
class MovieUpdatedState extends CRUDState {
  final String titleOfUpdatedMovie;

  MovieUpdatedState({required this.titleOfUpdatedMovie});
  @override
  List<Object?> get props => [titleOfUpdatedMovie];
}

// for deleting existing movie
class MovieDeletedState extends CRUDState {}

// for posting new movie
class OperationSuccess extends CRUDState {
  final Movie postedMovie;
  OperationSuccess({required this.postedMovie});
}

// for any crud failure
class OperationFailure extends CRUDState {
  final String? msg;
  OperationFailure({required this.msg});
  @override
  List<Object?> get props => [msg];
}
