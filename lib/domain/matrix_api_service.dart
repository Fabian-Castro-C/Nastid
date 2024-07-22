import 'package:http/http.dart' as http;

class MatrixApiService {
  final String baseUrl;

  MatrixApiService({required this.baseUrl});

  Future<http.Response> fetchImage() async {
    return http.get(Uri.parse('$baseUrl/matrix'));
  }
}