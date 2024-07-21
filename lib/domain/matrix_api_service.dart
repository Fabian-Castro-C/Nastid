import 'package:http/http.dart' as http;
import 'dart:convert';

class MatrixApiService {
  final String baseUrl;

  MatrixApiService({required this.baseUrl});

  Future<List<List<int>>> fetchMatrix() async {
    final response = await http.get(Uri.parse('$baseUrl/matrix'));

    if (response.statusCode == 200) {
      List<List<int>> matrix = List<List<int>>.from(
        json.decode(response.body).map((x) => List<int>.from(x)),
      );
      return matrix;
    } else {
      throw Exception('Failed to load matrix');
    }
  }
}