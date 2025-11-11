# Funcionalidades CRUD Implementadas

## Descripción
Se han implementado las funcionalidades completas de CRUD (Create, Read, Update, Delete) para las tres tablas principales de la aplicación SICA.

## Características Implementadas

### 1. **Crear Registros** ✅
Cada página (Sexo, Teléfono, Persona) ahora incluye un botón flotante (+) que abre un diálogo para crear nuevos registros.
- **Sexo**: Crear nuevo sexo
- **Teléfono**: Crear nuevo teléfono
- **Persona**: Crear nueva persona con todos los campos

### 2. **Leer Registros** ✅
Los registros se cargan automáticamente desde la API y se muestran en listas:
- Búsqueda y filtrado en tiempo real
- Indicador de carga mientras se obtienen los datos
- Manejo de errores

### 3. **Actualizar Registros** ✅
Cada registro cuenta con un menú contextual (⋮) con opción de editar:
- Abre un diálogo con los datos del registro
- El ID no es editable (read-only)
- Los cambios se envían a la API

### 4. **Eliminar Registros** ✅
Cada registro cuenta con opción de eliminar en el menú contextual:
- Solicita confirmación antes de eliminar
- Botón rojo para indicar peligro
- Se refresca la lista después de eliminar

## Cambios en el Código

### UI Improvements
- **FloatingActionButton**: Botón (+) para crear nuevos registros
- **PopupMenuButton**: Menú contextual con opciones Editar y Eliminar
- **AlertDialog**: Formularios modal para crear/editar
- **SnackBar**: Notificaciones de éxito/error

### Endpoints API Utilizados
```
GET: /[Tabla]Controller.php?action=api       → Obtener todos
POST: /[Tabla]Controller.php?action=create   → Crear nuevo
PUT: /[Tabla]Controller.php?action=update    → Actualizar
DELETE: /[Tabla]Controller.php?action=delete → Eliminar
```

Donde `[Tabla]` puede ser: **Sexo**, **Telefono**, **Persona**

## Estructura de Requests

### CREATE (POST)
```json
{
  "nombre": "Valor"
}
```

### UPDATE (PUT)
```json
{
  "id[Tabla]": "123",
  "nombre": "Nuevo valor"
}
```

### DELETE (DELETE)
```json
{
  "id[Tabla]": "123"
}
```

## Validaciones Implementadas

- ✅ Campos requeridos en formularios
- ✅ Confirmación antes de eliminar
- ✅ Mensajes de error capturados
- ✅ Notificaciones de éxito/error en SnackBar

## Archivos Creados/Modificados

### Creados:
- `lib/services/api_service.dart` - Servicios genéricos de API
- `lib/models/models.dart` - Modelos de datos reutilizables

### Modificados:
- `lib/main.dart` - Actualizado con funcionalidades CRUD

## Cómo Usar

### Crear un registro:
1. Haz clic en el botón flotante (+)
2. Completa el formulario
3. Haz clic en "Crear"

### Editar un registro:
1. Haz clic en el menú (⋮) del registro
2. Selecciona "Editar"
3. Modifica los datos
4. Haz clic en "Actualizar"

### Eliminar un registro:
1. Haz clic en el menú (⋮) del registro
2. Selecciona "Eliminar"
3. Confirma la eliminación

## Notas Importantes

- Los IDs generados por la base de datos no pueden editarse
- Se requiere conexión a internet para las operaciones CRUD
- Los errores se capturan y se muestran en SnackBar
- La lista se refresca automáticamente después de crear/actualizar/eliminar

## Próximas Mejoras Sugeridas

- [ ] Agregar validaciones más específicas
- [ ] Implementar paginación para grandes listas
- [ ] Agregar sincronización local con base de datos
- [ ] Mejorar la experiencia de usuario con loading spinners
- [ ] Agregar funcionalidad de exportar datos
