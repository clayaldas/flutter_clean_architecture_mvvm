import 'package:flutter_clean_architecture_mvvm/src/common/network/api/local_api_client.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/utils/constants/preferences_keys.dart';
import 'package:injectable/injectable.dart';
import 'notes_local_datasource.dart';

// Inyección de dependencias (IoC)
// Gracias al paquete "injectable.dart" esta clase sera inyectada automáticamente
// donde se necesite un objeto:NotesLocalDataSourceImplements 
@Injectable(as: NotesLocalDataSource)  
class NotesLocalDataSourceImplements implements NotesLocalDataSource {
  final LocalApiClient _localApiClient;

  NotesLocalDataSourceImplements(this._localApiClient);

  @override
  Future<void> drecrementFavoriteCount() async {
    try {
      var currentCount =_localApiClient.getInt(PreferencesKeys.favoriteCount);
      currentCount--;

      await _localApiClient.setInt(PreferencesKeys.favoriteCount, value: currentCount);
    }catch(_) {
      //_ : Atrapar cualquier excepción generada en el bloque try
      // rethrow: lance la misma excepción al sitio donde se invoque 
      //          al método.
      rethrow;
    }
  }

  @override
  Future<void> incrementFavoriteCount() async {
    try {
      var currentCount =_localApiClient.getInt(PreferencesKeys.favoriteCount);
      currentCount++;

      await _localApiClient.setInt(PreferencesKeys.favoriteCount, value: currentCount);
    }catch(_) {
      //_ : Atrapar cualquier excepción generada en el bloque try
      // rethrow: lance la misma excepción al sitio donde se invoque 
      //          al método.
      rethrow;
    }
  }
}