import 'package:equatable/equatable.dart';
import 'dart:typed_data';

abstract class MatrixState extends Equatable {
  const MatrixState();

  @override
  List<Object> get props => [];
}

class MatrixInitial extends MatrixState {}

class MatrixLoading extends MatrixState {}

class MatrixLoaded extends MatrixState {
  final Uint8List imageBytes;
  const MatrixLoaded(this.imageBytes);
}

class MatrixError extends MatrixState {
  final String message;
  const MatrixError(this.message);
}