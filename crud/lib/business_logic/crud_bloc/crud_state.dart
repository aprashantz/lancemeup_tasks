part of 'crud_bloc.dart';

abstract class CRUDState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CRUDState {}

class OperationLoading extends CRUDState {}

class OperationSuccess extends CRUDState {
  final Movie postedMovie;
  OperationSuccess({required this.postedMovie});
}

class OperationFailure extends CRUDState {
  final String? msg;
  OperationFailure({required this.msg});
  @override
  List<Object?> get props => [msg];
}
