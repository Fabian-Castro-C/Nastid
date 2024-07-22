import 'matrix_api_service.dart';
import 'dart:typed_data';

class MatrixRepository {
  final MatrixApiService apiService;

  MatrixRepository({required this.apiService});

  Future<Uint8List> getImage() async {
    final response = await apiService.fetchImage();

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Error al cargar la imagen');
    }
  }
}