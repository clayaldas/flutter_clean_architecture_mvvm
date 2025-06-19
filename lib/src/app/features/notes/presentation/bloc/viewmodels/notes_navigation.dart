part of 'notes_view_model.dart';

sealed class NotesNavigation {}

// Esta clase es la encargada de coordinar las funciones/transaciones de
// navegación. Para que a aplicación sea modular y testeable.
// Define las acciones de navegacion.

class ProfileNavigation extends NotesNavigation{}

class ExitNavigation extends NotesNavigation{}