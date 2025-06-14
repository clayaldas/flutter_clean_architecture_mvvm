import 'package:flutter_clean_architecture_mvvm/src/common/network/api/remote_api_client.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/network/error/api_error.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/note_model.dart';
import 'notes_remote_datasource.dart';

@Injectable(as: NotesRemoteDataSource)// Clase abstracta
class NotesRemoteDataSourceImplements implements NotesRemoteDataSource{
  final RemoteApiClient _apiClient;
  // Inyectar la interfaz.
  NotesRemoteDataSourceImplements(this._apiClient);

  @override
  Future<NoteModel> createNote({required NoteModel note}) async{
    try {
      final response = await _apiClient.post('/notes', data: note.toJson());
      return NoteModel.fromJson(response.data);
    }catch(e) {
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<bool> deleteNote({required int noteId}) async {
    try {
      final response = await _apiClient.delete('/notes/$noteId');
      return response.statusCode == 200;
    }catch(e) {
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final response = await _apiClient.get('/notes');

      return (response.data as List)
      .map((note)=> NoteModel
      .fromJson(note)).toList();

    }catch(e) {
      throw ApiError.fromDioError(e);
    }
  }

}