// Esta clase permite manejar elementos emergentes o temporales
// tales como: formularios, alertas, popups con el fin de no saturar
// el estado principal. Con el fin de tener facilidad para agregar
// interacciones adicionales.

part of 'notes_view_model.dart';

sealed class NotesOverlay {}

// Para crear el formulario/Page
class CreateNoteFormOverlay extends NotesOverlay {}

// Para generar alertas (errores: Create, Delete, etc.)
class ServiceErrorOverlay extends NotesOverlay {}

// Para mantener indicadores visuales del incremento de notas favoritas.
class IncreaseFavoriteCountOverlay extends NotesOverlay {}

// Para mantener indicadores visuales del decremento de notas favoritas.
class DecreaseFavoriteCountOverlay extends NotesOverlay {}