import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp()); // Cambiado el nombres de la app a MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SICA App', // Título de la aplicación
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Lista de páginas que se mostrarán en el cuerpo del Scaffold
  // El orden aquí debe coincidir con el orden de los BottomNavigationBarItem
  final List<Widget> _pages = [
    SexoPage(),
    TelefonoPage(),
    PersonaPage(), // Nueva página para Personas
    Placeholder(), // Página "Acerca de" o cualquier otra que desees
  ];

  // Función que se llama cuando se toca un elemento del BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showPersonasRegistradas() {
    // IDs y nombres de personas registradas
    final personas = [
      {'id': '11', 'nombre': 'Anthony Tenorio', 'sexo': 'Hombres'},
      {'id': '12', 'nombre': 'Michael Geampierre Marquez Plaza', 'sexo': 'Hombres'},
      {'id': '10', 'nombre': 'Karina Isabel Renteria Valencia', 'sexo': 'Mujer'},
      {'id': '13', 'nombre': 'Pierina Lilibet Ventes Loor', 'sexo': 'Mujer'},
      {'id': '16', 'nombre': 'Tamara Betzabet Becerra Navarrete', 'sexo': 'Mujer'},
      {'id': '18', 'nombre': 'Andrea Stefanía Quiñónez Tafur', 'sexo': 'Binario'},
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('📋 Personas Registradas'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...personas.map((p) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            p['id']!,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p['nombre']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Sexo: ${p['sexo']}',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SICA - Registro"),
        actions: [
          IconButton(
            icon: Icon(Icons.people_alt),
            tooltip: 'Ver personas registradas',
            onPressed: _showPersonasRegistradas,
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Sexo'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Telefono'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Persona'), // Nuevo ítem para Persona
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Acerca de'),
        ],
        currentIndex: _selectedIndex, // Índice del ítem seleccionado actualmente
        onTap: _onItemTapped, // Callback cuando se toca un ítem
        selectedItemColor: Colors.blue, // Color del ítem seleccionado
        unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados
      ),
    );
  }
}

// --- Clases de Modelo ---

// Modelo para los datos de Sexo
class Sexo {
  final String idsexo;
  final String nombre;

  Sexo({required this.idsexo, required this.nombre});

  factory Sexo.fromJson(Map<String, dynamic> json) {
    return Sexo(
      idsexo: json['idsexo'].toString(),
      nombre: json['nombre'],
    );
  }
}

// Modelo para los datos de Sexo
class Telefono {
  final String idtelefono;
  final String numero;
  final String? idpersona;

  Telefono({required this.idtelefono, required this.numero, this.idpersona});

  factory Telefono.fromJson(Map<String, dynamic> json) {
    return Telefono(
      idtelefono: json['idtelefono'].toString(),
      numero: json['numero'],
      idpersona: json['idpersona']?.toString(),
    );
  }
}







// Modelo para los datos de Persona
class Persona {
  final String idpersona;
  final String nombres;
  final String apellidos;
  final String elsexo;
  final String idsexo;
  final String elestadocivil;
  final String idestadocivil;
  final String fechanacimiento;

  Persona({
    required this.idpersona,
    required this.nombres,
    required this.apellidos,
    required this.elsexo,
    required this.idsexo,
    required this.elestadocivil,
    required this.idestadocivil,
    required this.fechanacimiento,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      idpersona: json['idpersona'].toString(),
      nombres: json['nombres'] ?? 'N/A',
      apellidos: json['apellidos'] ?? 'N/A',
      elsexo: json['elsexo'] ?? 'N/A',
      idsexo: json['idsexo']?.toString() ?? '',
      elestadocivil: json['elestadocivil'] ?? 'N/A',
      idestadocivil: json['idestadocivil']?.toString() ?? '',
      fechanacimiento: json['fechanacimiento'] ?? 'N/A',
    );
  }
}

// --- Páginas de Contenido ---

// Página para mostrar la lista de Sexo
class SexoPage extends StatefulWidget {
  @override
  _SexoPageState createState() => _SexoPageState();
}

class _SexoPageState extends State<SexoPage> {
  List<Sexo> _sexoList = [];
  List<Sexo> _filteredSexoList = [];
  bool _isLoading = true; // Para mostrar un indicador de carga

  @override
  void initState() {
    super.initState();
    _fetchSexoData();
  }

  Future<void> _fetchSexoData() async {
    setState(() {
      _isLoading = true; // Inicia la carga
    });
    try {
      final response = await http.get(Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=api'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _sexoList = data.map((item) => Sexo.fromJson(item)).toList();
          _filteredSexoList = _sexoList;
        });
      } else {
        throw Exception('Error al cargar datos de Sexo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener datos de Sexo: $e');
      // Podrías mostrar un mensaje de error al usuario aquí
    } finally {
      setState(() {
        _isLoading = false; // Finaliza la carga
      });
    }
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredSexoList = _sexoList
          .where((item) =>
              item.nombre.toLowerCase().contains(query.toLowerCase()) ||
              item.idsexo.contains(query))
          .toList();
    });
  }

  // --- CRUD helpers for Sexo ---
  void _showSexoForm({Sexo? sexo}) {
    final _formKey = GlobalKey<FormState>();
    String nombre = sexo?.nombre ?? '';
    String idsexo = sexo?.idsexo ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sexo == null ? 'Crear Sexo' : 'Actualizar Sexo'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: nombre,
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: (v) => (v == null || v.isEmpty) ? 'Ingrese nombre' : null,
            onSaved: (v) => nombre = v ?? '',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              _formKey.currentState!.save();
              try {
                if (sexo == null) {
                  // enviar form-urlencoded
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=create'),
                    body: {'nombre': nombre},
                  );
                  print('POST Sexo status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('creado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showSnackbar('Sexo creado');
                    await _fetchSexoData();
                  } else {
                    _showSnackbar('Error crear: ${resp.statusCode}', isError: true);
                  }
                } else {
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=update'),
                    body: {'idsexo': idsexo, 'nombre': nombre},
                  );
                  print('UPDATE Sexo status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('actualizado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showSnackbar('Sexo actualizado');
                    await _fetchSexoData();
                  } else {
                    _showSnackbar('Error actualizar: ${resp.statusCode}', isError: true);
                  }
                }
              } catch (e) {
                print('Exception sexo save: $e');
                _showSnackbar('Excepción: $e', isError: true);
              }
            },
            child: Text(sexo == null ? 'Crear' : 'Actualizar'),
          ),
        ],
      ),
    );
  }

  void _deleteSexo(String idsexo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar'),
        content: Text('Eliminar este registro?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              try {
                // many PHP backends expect form data even for delete
                final resp = await http.post(
                  Uri.parse('https://educaysoft.org/apple6b/app/controllers/SexoController.php?action=delete'),
                  body: {'idsexo': idsexo},
                );
                print('DELETE Sexo status=${resp.statusCode} body=${resp.body}');
                if (resp.statusCode == 200 || resp.body.contains('eliminado') || resp.body.contains('success')) {
                  Navigator.pop(context);
                  _showSnackbar('Sexo eliminado');
                  await _fetchSexoData();
                } else {
                  _showSnackbar('Error eliminar: ${resp.statusCode}', isError: true);
                }
              } catch (e) {
                print('Exception delete sexo: $e');
                _showSnackbar('Excepción: $e', isError: true);
              }
            },
            child: Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda + crear
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _filterSearch,
                  decoration: InputDecoration(
                    labelText: 'Buscar Sexo',
                    hintText: 'Ingrese nombres o ID',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => _showSexoForm(),
                child: Icon(Icons.add),
                tooltip: 'Crear Sexo',
              ),
            ],
          ),
        ),
        // Lista de registros
        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // Indicador de carga
              : _filteredSexoList.isEmpty
                  ? Center(child: Text("No hay datos de Sexo disponibles"))
                  : ListView.builder(
                      itemCount: _filteredSexoList.length,
                      itemBuilder: (context, index) {
                        final sexo = _filteredSexoList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.people, color: Colors.blueAccent),
                            title: Text(sexo.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("ID: ${sexo.idsexo}"),
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(child: Text('Editar'), value: 'edit'),
                                PopupMenuItem(child: Text('Eliminar', style: TextStyle(color: Colors.red)), value: 'delete'),
                              ],
                              onSelected: (value) {
                                if (value == 'edit') {
                                  _showSexoForm(sexo: sexo);
                                } else if (value == 'delete') {
                                  _deleteSexo(sexo.idsexo);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}











// Página para mostrar la lista de Telefono
class TelefonoPage extends StatefulWidget {
  @override
  _TelefonoPageState createState() => _TelefonoPageState();
}

class _TelefonoPageState extends State<TelefonoPage> {
  List<Telefono> _telefonoList = [];
  List<Telefono> _filteredTelefonoList = [];
  bool _isLoading = true; // Para mostrar un indicador de carga

  @override
  void initState() {
    super.initState();
    _fetchTelefonoData();
  }

  Future<void> _fetchTelefonoData() async {
    setState(() {
      _isLoading = true; // Inicia la carga
    });
    try {
      final response = await http.get(Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=api'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _telefonoList = data.map((item) => Telefono.fromJson(item)).toList();
          _filteredTelefonoList = _telefonoList;
        });
      } else {
        throw Exception('Error al cargar datos de Telefono: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener datos de Telefono: $e');
      // Podrías mostrar un mensaje de error al usuario aquí
    } finally {
      setState(() {
        _isLoading = false; // Finaliza la carga
      });
    }
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredTelefonoList = _telefonoList
          .where((item) =>
              item.numero.toLowerCase().contains(query.toLowerCase()) ||
              item.idtelefono.contains(query))
          .toList();
    });
  }

  // --- CRUD helpers for Telefono ---
  void _showTelefonoForm({Telefono? telefono}) {
    final _formKey = GlobalKey<FormState>();
    String numero = telefono?.numero ?? '';
    String idtelefono = telefono?.idtelefono ?? '';
    String idpersona = telefono?.idpersona ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(telefono == null ? 'Crear Teléfono' : 'Actualizar Teléfono'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: numero,
                decoration: InputDecoration(labelText: 'Número'),
                validator: (v) => (v == null || v.isEmpty) ? 'Ingrese número' : null,
                onSaved: (v) => numero = v ?? '',
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: idpersona,
                decoration: InputDecoration(labelText: 'ID Persona'),
                validator: (v) => (v == null || v.isEmpty) ? 'Ingrese ID Persona' : null,
                onSaved: (v) => idpersona = v ?? '',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              _formKey.currentState!.save();
              try {
                if (telefono == null) {
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=create'),
                    body: {'numero': numero, 'idpersona': idpersona},
                  );
                  print('POST Telefono status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('creado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showTelefonoSnackbar('Teléfono creado');
                    await _fetchTelefonoData();
                  } else {
                    _showTelefonoSnackbar('Error crear: ${resp.statusCode}', isError: true);
                  }
                } else {
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/TelefonoController.php?action=update'),
                    body: {'idtelefono': idtelefono, 'numero': numero, 'idpersona': idpersona},
                  );
                  print('UPDATE Telefono status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('actualizado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showTelefonoSnackbar('Teléfono actualizado');
                    await _fetchTelefonoData();
                  } else {
                    _showTelefonoSnackbar('Error actualizar: ${resp.statusCode}', isError: true);
                  }
                }
              } catch (e) {
                print('Exception telefono save: $e');
                _showTelefonoSnackbar('Excepción: $e', isError: true);
              }
            },
            child: Text(telefono == null ? 'Crear' : 'Actualizar'),
          ),
        ],
      ),
    );
  }

  void _deleteTelefono(String idtelefono, String idpersona) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Eliminar Teléfono'),
        content: Text('⚠️ La función de eliminar Teléfono no está disponible en el servidor.\n\nContacte al administrador.'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _showTelefonoSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda + crear
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _filterSearch,
                  decoration: InputDecoration(
                    labelText: 'Buscar Teléfono',
                    hintText: 'Ingrese números o ID',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => _showTelefonoForm(),
                child: Icon(Icons.add),
                tooltip: 'Crear Teléfono',
              ),
            ],
          ),
        ),
        // Lista de registros
        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // Indicador de carga
              : _filteredTelefonoList.isEmpty
                  ? Center(child: Text("No hay datos de Telefono disponibles"))
                  : ListView.builder(
                      itemCount: _filteredTelefonoList.length,
                      itemBuilder: (context, index) {
                        final telefono = _filteredTelefonoList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.people, color: Colors.blueAccent),
                            title: Text(telefono.numero, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("ID: ${telefono.idtelefono}"),
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(child: Text('Editar'), value: 'edit'),
                                PopupMenuItem(child: Text('Eliminar', style: TextStyle(color: Colors.red)), value: 'delete'),
                              ],
                              onSelected: (value) {
                                if (value == 'edit') {
                                  _showTelefonoForm(telefono: telefono);
                                } else if (value == 'delete') {
                                  _deleteTelefono(telefono.idtelefono, telefono.idpersona ?? '');
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

// Página para mostrar la lista de Persona
class PersonaPage extends StatefulWidget {
  @override
  _PersonaPageState createState() => _PersonaPageState();
}

class _PersonaPageState extends State<PersonaPage> {
  List<Persona> _personaList = [];
  List<Persona> _filteredPersonaList = [];
  bool _isLoading = true; // Para mostrar un indicador de carga

  @override
  void initState() {
    super.initState();
    _fetchPersonaData();
  }

  Future<void> _fetchPersonaData() async {
    setState(() {
      _isLoading = true; // Inicia la carga
    });
    try {
      final response = await http.get(Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=api'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _personaList = data.map((item) => Persona.fromJson(item)).toList();
          _filteredPersonaList = _personaList;
        });
      } else {
        throw Exception('Error al cargar datos de Persona: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener datos de Persona: $e');
      // Podrías mostrar un mensaje de error al usuario aquí
    } finally {
      setState(() {
        _isLoading = false; // Finaliza la carga
      });
    }
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredPersonaList = _personaList
          .where((item) =>
              item.nombres.toLowerCase().contains(query.toLowerCase()) ||
              item.apellidos.toLowerCase().contains(query.toLowerCase()) ||
              item.fechanacimiento.contains(query))
          .toList();
    });
  }

  // --- CRUD helpers for Persona ---
  void _showPersonaForm({Persona? persona}) {
    final _formKey = GlobalKey<FormState>();
    String nombres = persona?.nombres ?? '';
    String apellidos = persona?.apellidos ?? '';
    String idsexo = persona?.idsexo ?? '';
    String idestadocivil = persona?.idestadocivil ?? '';
    String fechanacimiento = persona?.fechanacimiento ?? '';
    String idpersona = persona?.idpersona ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(persona == null ? 'Crear Persona' : 'Actualizar Persona'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: nombres,
                  decoration: InputDecoration(labelText: 'Nombres'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Ingrese nombres' : null,
                  onSaved: (v) => nombres = v ?? '',
                ),
                SizedBox(height: 8),
                TextFormField(
                  initialValue: apellidos,
                  decoration: InputDecoration(labelText: 'Apellidos'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Ingrese apellidos' : null,
                  onSaved: (v) => apellidos = v ?? '',
                ),
                SizedBox(height: 8),
                TextFormField(
                  initialValue: idsexo,
                  decoration: InputDecoration(labelText: 'ID Sexo (1=Hombres, 2=Mujer, 21=Desconocido)'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Ingrese ID Sexo' : null,
                  onSaved: (v) => idsexo = v ?? '',
                ),
                SizedBox(height: 8),
                TextFormField(
                  initialValue: idestadocivil,
                  decoration: InputDecoration(labelText: 'ID Estado Civil (1=Soltero/a, 2=Casado)'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Ingrese ID Estado Civil' : null,
                  onSaved: (v) => idestadocivil = v ?? '',
                ),
                SizedBox(height: 8),
                TextFormField(
                  initialValue: fechanacimiento,
                  decoration: InputDecoration(labelText: 'Fecha Nacimiento (YYYY-MM-DD)'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Ingrese fecha' : null,
                  onSaved: (v) => fechanacimiento = v ?? '',
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              _formKey.currentState!.save();
              try {
                if (persona == null) {
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=create'),
                    body: {
                      'nombres': nombres,
                      'apellidos': apellidos,
                      'idsexo': idsexo,
                      'idestadocivil': idestadocivil,
                      'fechanacimiento': fechanacimiento,
                    },
                  );
                  print('POST Persona status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('creada') || resp.body.contains('creado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showPersonaSnackbar('Persona creada');
                    await _fetchPersonaData();
                  } else {
                    _showPersonaSnackbar('Error crear: ${resp.statusCode}', isError: true);
                  }
                } else {
                  final resp = await http.post(
                    Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=update'),
                    body: {
                      'idpersona': idpersona,
                      'nombres': nombres,
                      'apellidos': apellidos,
                      'idsexo': idsexo,
                      'idestadocivil': idestadocivil,
                      'fechanacimiento': fechanacimiento,
                    },
                  );
                  print('UPDATE Persona status=${resp.statusCode} body=${resp.body}');
                  if (resp.statusCode == 200 || resp.body.contains('actualizada') || resp.body.contains('actualizado') || resp.body.contains('success')) {
                    Navigator.pop(context);
                    _showPersonaSnackbar('Persona actualizada');
                    await _fetchPersonaData();
                  } else {
                    _showPersonaSnackbar('Error actualizar: ${resp.statusCode}', isError: true);
                  }
                }
              } catch (e) {
                print('Exception persona save: $e');
                _showPersonaSnackbar('Excepción: $e', isError: true);
              }
            },
            child: Text(persona == null ? 'Crear' : 'Actualizar'),
          ),
        ],
      ),
    );
  }

  void _deletePersona(String idpersona, String idsexo, String idestadocivil) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar'),
        content: Text('Eliminar este registro?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              try {
                final resp = await http.post(
                  Uri.parse('https://educaysoft.org/apple6b/app/controllers/PersonaController.php?action=delete'),
                  body: {'idpersona': idpersona, 'idsexo': idsexo, 'idestadocivil': idestadocivil},
                );
                print('DELETE Persona status=${resp.statusCode} body=${resp.body}');
                if (resp.statusCode == 200 || resp.body.contains('eliminada') || resp.body.contains('eliminado') || resp.body.contains('success')) {
                  Navigator.pop(context);
                  _showPersonaSnackbar('Persona eliminada');
                  await _fetchPersonaData();
                } else {
                  _showPersonaSnackbar('Error eliminar: ${resp.statusCode}', isError: true);
                }
              } catch (e) {
                print('Exception delete persona: $e');
                _showPersonaSnackbar('Excepción: $e', isError: true);
              }
            },
            child: Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _showPersonaSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda + crear
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _filterSearch,
                  decoration: InputDecoration(
                    labelText: 'Buscar Persona',
                    hintText: 'Ingrese nombres, apellidos o cédula',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => _showPersonaForm(),
                child: Icon(Icons.add),
                tooltip: 'Crear Persona',
              ),
            ],
          ),
        ),
        // Lista de registros
        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // Indicador de carga
              : _filteredPersonaList.isEmpty
                  ? Center(child: Text("No hay datos de Persona disponibles"))
                  : ListView.builder(
                      itemCount: _filteredPersonaList.length,
                      itemBuilder: (context, index) {
                        final persona = _filteredPersonaList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.green),
                            title: Text("${persona.nombres} ${persona.apellidos}", style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fechanacimiento: ${persona.fechanacimiento}"),
                                Text("TSexo: ${persona.elsexo}"),
                                Text("Estado Civil: ${persona.elestadocivil}"),
                              ],
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(child: Text('Editar'), value: 'edit'),
                                PopupMenuItem(child: Text('Eliminar', style: TextStyle(color: Colors.red)), value: 'delete'),
                              ],
                              onSelected: (value) {
                                if (value == 'edit') {
                                  _showPersonaForm(persona: persona);
                                } else if (value == 'delete') {
                                  _deletePersona(persona.idpersona, persona.idsexo, persona.idestadocivil);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}