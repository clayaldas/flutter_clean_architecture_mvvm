
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteNoteUsecase {
  final NoteRepository _repository;

  DeleteNoteUsecase(this._repository);

  Future<Either<ApiError, bool>> call({required noteId}) async {
    return await _repository.deleteNote(noteId: noteId);
  }
}