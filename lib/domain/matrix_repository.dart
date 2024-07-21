import 'matrix_api_service.dart';

class MatrixRepository {
  final MatrixApiService apiService;

  MatrixRepository({required this.apiService});

  Future<List<List<int>>> getMatrix() async {
    return await apiService.fetchMatrix();
  }
}