import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/data/source/local/notes_local_datasource.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/data/source/remote/notes_remote_datasource.dart';

import '/src/app/features/notes/domain/models/note_model.dart';
import '/src/app/features/notes/domain/repositories/note_repository.dart';
import '/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NoteRepository)
class NoteRepositoryImplements implements NoteRepository {
  final NotesRemoteDataSource _remoteDataSource; //clase abstracta
  final NotesLocalDataSource _localDataSource; //clase abstracta

  NoteRepositoryImplements (this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<ApiError, NoteModel>> createNote({required NoteModel note}) async {
    try {
      final createNote = await _remoteDataSource.createNote(note: note);
      return Right(createNote);
    } catch (e) {
      return Left(e as ApiError);
    }
  }  

  @override
  Future<Either<ApiError, bool>> deleteNote({required int noteId}) async {
    try {
      final noteWasDetelete = await _remoteDataSource.deleteNote(noteId: noteId);
      return Right(noteWasDetelete);
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<Either<ApiError, List<NoteModel>>> getNotes() async {
    try {
      final notes = await _remoteDataSource.getNotes();
      return Right(notes);
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<void> increaseFavoriteCount() async {
    await _localDataSource.incrementFavoriteCount();
  }

  @override
  Future<void> decreaseFavoriteCount() async {
    await _localDataSource.drecrementFavoriteCount();
  }
}