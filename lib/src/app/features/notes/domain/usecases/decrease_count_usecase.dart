
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DecreaseCountUsecase {
  final NoteRepository _repository;

  DecreaseCountUsecase(this._repository);

  Future<void> call() async {
    await _repository.decreaseFavoriteCount();
  }
}