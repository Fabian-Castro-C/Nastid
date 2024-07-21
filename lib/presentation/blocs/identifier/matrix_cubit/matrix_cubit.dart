import 'package:flutter_bloc/flutter_bloc.dart';
import 'matrix_state.dart';
import 'package:nastid/domain/matrix_repository.dart';

class MatrixCubit extends Cubit<MatrixState> {
  final MatrixRepository repository;

  MatrixCubit({required this.repository}) : super(MatrixInitial());

  Future<void> loadMatrix() async {
    try {
      emit(MatrixLoading());
      final matrix = await repository.getMatrix();
      emit(MatrixLoaded(matrix));
    } catch (e) {
      emit(MatrixError(e.toString()));
    }
  }
}