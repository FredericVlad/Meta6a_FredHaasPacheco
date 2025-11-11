import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://educaysoft.org/apple6b/app/controllers';

  // Método genérico GET
  static Future<List<dynamic>> fetchData(String controller) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/${controller}Controller.php?action=api'),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body) as List<dynamic>;
      } else {
        throw Exception('Error al cargar datos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en fetchData: $e');
      rethrow;
    }
  }

  // Método genérico POST (Create)
  static Future<Map<String, dynamic>> createData(
    String controller,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/${controller}Controller.php?action=create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al crear registro: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en createData: $e');
      rethrow;
    }
  }

  // Método genérico PUT (Update)
  static Future<Map<String, dynamic>> updateData(
    String controller,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${controller}Controller.php?action=update'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al actualizar registro: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en updateData: $e');
      rethrow;
    }
  }

  // Método genérico DELETE
  static Future<Map<String, dynamic>> deleteData(
    String controller,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/${controller}Controller.php?action=delete'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al eliminar registro: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en deleteData: $e');
      rethrow;
    }
  }
}
