// import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/models/note_model.dart';
import '../models/note_model.dart';
import '../repositories/note_repository.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

// @injectable: permite que la clase sea inyectada automáticamente 
// utilizando del paquete: get_it.
// La anotación: "@injectable" permite que esta clase pueda ser registrada 
//  e inyectada automáticamente en otras clases
// No se sabe si los datos vienen de API, Sqlite, Firebase, Mongo, archivos, etc.
@injectable 
class GetNotesUsecase {
  // Inyección de dependencias.
  final NoteRepository _repository;

  GetNotesUsecase(this._repository);

  Future<Either<ApiError, List<NoteModel>>> call() async {
    return await _repository.getNotes();
  }
}