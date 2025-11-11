// Modelo para los datos de Sexo
class Sexo {
  final String idsexo;
  final String nombre;

  Sexo({required this.idsexo, required this.nombre});

  factory Sexo.fromJson(Map<String, dynamic> json) {
    return Sexo(
      idsexo: json['idsexo'].toString(),
      nombre: json['nombre'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idsexo': idsexo,
      'nombre': nombre,
    };
  }
}

// Modelo para los datos de Telefono
class Telefono {
  final String idtelefono;
  final String numero;

  Telefono({required this.idtelefono, required this.numero});

  factory Telefono.fromJson(Map<String, dynamic> json) {
    return Telefono(
      idtelefono: json['idtelefono'].toString(),
      numero: json['numero'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idtelefono': idtelefono,
      'numero': numero,
    };
  }
}

// Modelo para los datos de Persona
class Persona {
  final String idpersona;
  final String nombres;
  final String apellidos;
  final String elsexo;
  final String elestadocivil;
  final String fechanacimiento;

  Persona({
    required this.idpersona,
    required this.nombres,
    required this.apellidos,
    required this.elsexo,
    required this.elestadocivil,
    required this.fechanacimiento,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      idpersona: json['idpersona'].toString(),
      nombres: json['nombres'] ?? 'N/A',
      apellidos: json['apellidos'] ?? 'N/A',
      elsexo: json['elsexo'] ?? 'N/A',
      elestadocivil: json['elestadocivil'] ?? 'N/A',
      fechanacimiento: json['fechanacimiento'] ?? 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idpersona': idpersona,
      'nombres': nombres,
      'apellidos': apellidos,
      'elsexo': elsexo,
      'elestadocivil': elestadocivil,
      'fechanacimiento': fechanacimiento,
    };
  }
}
