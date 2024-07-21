import 'package:equatable/equatable.dart';

abstract class MatrixState extends Equatable {
  const MatrixState();

  @override
  List<Object> get props => [];
}

class MatrixInitial extends MatrixState {}

class MatrixLoading extends MatrixState {}

class MatrixLoaded extends MatrixState {
  final List<List<int>> matrix;

  const MatrixLoaded(this.matrix);

  @override
  List<Object> get props => [matrix];
}

class MatrixError extends MatrixState {
  final String message;

  const MatrixError(this.message);

  @override
  List<Object> get props => [message];
}