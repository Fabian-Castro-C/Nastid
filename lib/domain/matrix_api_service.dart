import 'package:http/http.dart' as http;
import 'dart:convert';

class MatrixApiService {
  final String baseUrl;

  MatrixApiService({required this.baseUrl});

  Future<List<List<double>>> fetchMatrix() async {
    final response = await http.get(Uri.parse('$baseUrl/matrix'));

    if (response.statusCode == 200) {
      // Decodifica el JSON en un mapa
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Imprime el JSON para depuración
      print('JSON recibido: $jsonResponse');

      // Asegúrate de que el JSON tiene la clave "matrix"
      if (jsonResponse.containsKey('matrix')) {
        final List<dynamic> matrixJson = jsonResponse['matrix'];

        List<List<double>> matrix = matrixJson.map((dynamic row) {
          return List<double>.from(row.map((dynamic value) => (value as num).toDouble()));
        }).toList();

        return matrix;
      } else {
        throw Exception('Clave "matrix" no encontrada en la respuesta JSON');
      }
    } else {
      throw Exception('Failed to load matrix');
    }
  }
}