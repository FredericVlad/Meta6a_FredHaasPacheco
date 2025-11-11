// Ejemplo de cómo usar los servicios CRUD
// Este archivo es solo con fines educativos

import 'package:http/http.dart' as http;
import 'dart:convert';

class CrudExample {
  // EJEMPLO 1: Crear un nuevo Sexo
  static Future<void> createSexoExample() async {
    try {
      final response = await http.post(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nombre': 'Otro Género',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        print('Sexo creado: $result');
      }
    } catch (e) {
      print('Error al crear: $e');
    }
  }

  // EJEMPLO 2: Crear un nuevo Teléfono
  static Future<void> createTelefonoExample() async {
    try {
      final response = await http.post(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'numero': '+58 412 1234567',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        print('Teléfono creado: $result');
      }
    } catch (e) {
      print('Error al crear: $e');
    }
  }

  // EJEMPLO 3: Crear una nueva Persona
  static Future<void> createPersonaExample() async {
    try {
      final response = await http.post(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nombres': 'Juan',
          'apellidos': 'Pérez',
          'elsexo': 'Masculino',
          'elestadocivil': 'Soltero',
          'fechanacimiento': '1990-05-15',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        print('Persona creada: $result');
      }
    } catch (e) {
      print('Error al crear: $e');
    }
  }

  // EJEMPLO 4: Actualizar un Sexo
  static Future<void> updateSexoExample() async {
    try {
      final response = await http.put(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=update'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idsexo': '1',
          'nombre': 'Femenino Actualizado',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Sexo actualizado: $result');
      }
    } catch (e) {
      print('Error al actualizar: $e');
    }
  }

  // EJEMPLO 5: Actualizar un Teléfono
  static Future<void> updateTelefonoExample() async {
    try {
      final response = await http.put(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=update'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idtelefono': '1',
          'numero': '+58 412 9876543',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Teléfono actualizado: $result');
      }
    } catch (e) {
      print('Error al actualizar: $e');
    }
  }

  // EJEMPLO 6: Actualizar una Persona
  static Future<void> updatePersonaExample() async {
    try {
      final response = await http.put(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=update'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idpersona': '1',
          'nombres': 'Carlos',
          'apellidos': 'González',
          'elsexo': 'Masculino',
          'elestadocivil': 'Casado',
          'fechanacimiento': '1985-08-20',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Persona actualizada: $result');
      }
    } catch (e) {
      print('Error al actualizar: $e');
    }
  }

  // EJEMPLO 7: Eliminar un Sexo
  static Future<void> deleteSexoExample() async {
    try {
      final response = await http.delete(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=delete'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idsexo': '5',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Sexo eliminado: $result');
      }
    } catch (e) {
      print('Error al eliminar: $e');
    }
  }

  // EJEMPLO 8: Eliminar un Teléfono
  static Future<void> deleteTelefonoExample() async {
    try {
      final response = await http.delete(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=delete'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idtelefono': '3',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Teléfono eliminado: $result');
      }
    } catch (e) {
      print('Error al eliminar: $e');
    }
  }

  // EJEMPLO 9: Eliminar una Persona
  static Future<void> deletePersonaExample() async {
    try {
      final response = await http.delete(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=delete'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idpersona': '2',
        }),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Persona eliminada: $result');
      }
    } catch (e) {
      print('Error al eliminar: $e');
    }
  }

  // EJEMPLO 10: Obtener todos los registros
  static Future<void> fetchAllExample() async {
    try {
      // Obtener todas las personas
      final response = await http.get(
        Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=api'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> personas = json.decode(response.body);
        print('Total de personas: ${personas.length}');
        for (var persona in personas) {
          print('${persona['nombres']} ${persona['apellidos']}');
        }
      }
    } catch (e) {
      print('Error al obtener: $e');
    }
  }
}
