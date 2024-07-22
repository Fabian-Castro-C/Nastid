import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'matrix_state.dart';
import 'package:nastid/domain/matrix_repository.dart';

class MatrixCubit extends Cubit<MatrixState> {
  final MatrixRepository repository;

  MatrixCubit({required this.repository}) : super(MatrixInitial());

  Future<void> loadImage() async {
    emit(MatrixLoading());
    
    try {
      final Uint8List imageBytes = await repository.getImage();
      emit(MatrixLoaded(imageBytes));
    } catch (e) {
      emit(MatrixError(e.toString()));
    }
  }
}