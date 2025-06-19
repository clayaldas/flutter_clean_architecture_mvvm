// Esta clase permite representar una nota en la UI.
// Unicamente contiene los datos necesarios para 
//mostrar en la Interfaz de Usuario.

part of 'notes_view_model.dart';


class NoteRowViewModel {
  final String title;
  final String content;

  NoteRowViewModel.fromModel(NoteModel model)
  : title = model.title.safeValue, content = model.content.safeValue;
}