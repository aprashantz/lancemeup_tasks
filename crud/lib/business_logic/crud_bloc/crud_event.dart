part of 'crud_bloc.dart';

abstract class CRUDEvent extends Equatable {
  const CRUDEvent();
  @override
  List<Object> get props => [];
}

class InitialCRUDEvent extends CRUDEvent {}

class AddMovieEvent extends CRUDEvent {
  final String title;
  final String description;
  const AddMovieEvent({required this.title, required this.description});
  @override
  List<Object> get props => [title, description];
}

class UpdateMovieEvent extends CRUDEvent {
  final int movieId;
  final String title;
  final String description;

  const UpdateMovieEvent(
      {required this.movieId, required this.title, required this.description});
}

class FetchMoviesEvent extends CRUDEvent {}
