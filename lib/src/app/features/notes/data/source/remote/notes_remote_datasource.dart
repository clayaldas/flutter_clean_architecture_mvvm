import '../../../domain/models/note_model.dart';

abstract class NotesRemoteDataSource  {

Future<List<NoteModel>> getNotes();

Future<NoteModel> createNote({required NoteModel note});

Future<bool> deleteNote({required int noteId});
}