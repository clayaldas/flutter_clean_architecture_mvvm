import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/models/note_model.dart';
// Para evitar errores con valores nulos
import 'package:safe_extensions/safe_extensions.dart';

// Esta clase representa el ViewModel (Viesta) principal de la app que sera
// renderizado por el estado. El cual esta contiene los ViewModels definidos
// anteriores:
// -NotesNavigation
// -NotesOverlay
// -NoteRowViewModel
// Los datos que muestre este ViewModel seran generados por el Bloc (Cubit).

// Indicar cuales son los archivos que forman parte de esta clase
// Permite la navegación entre pantallas.
part 'notes_navigation.dart';
//  Para emitir eventos visuales emergentes (alertas) por ejemplo: errores
part 'notes_overlay.dart';
// Permite simplificar la vista de notas para mostrar en la Intefaz.
part 'note_row_view_model.dart';

class NotesViewModel {
  final List<NoteRowViewModel> notesRowsViewModels;
  final NotesNavigation? navigation;
  final NotesOverlay? overlay;

  NotesViewModel.formSuccessState({
    required List<NoteModel> notes,
    this.navigation,
    this.overlay,
  }) : notesRowsViewModels = List.from(notes.map(NoteRowViewModel.fromModel));
}
