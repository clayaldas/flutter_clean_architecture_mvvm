
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/models/note_model.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable 
class CreateNoteUsecase {
  final NoteRepository _repository;

  CreateNoteUsecase (this._repository);

  Future<Either<ApiError, NoteModel>> call({required NoteModel note}) async {
    return _repository.createNote(note: note);//API, SQL Lite, Base de datos remote.
  }
}