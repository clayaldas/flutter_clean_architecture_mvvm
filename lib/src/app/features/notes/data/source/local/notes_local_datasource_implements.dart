import 'package:flutter_clean_architecture_mvvm/src/common/network/api/local_api_client.dart';
import 'package:flutter_clean_architecture_mvvm/src/common/utils/constants/preferences_keys.dart';
import 'package:injectable/injectable.dart';

import 'notes_local_datasource.dart';
class NotesLocalDatasourceImplements implements NotesLocalDatasource {
  @override
  Future<void> drecrementFavoriteCount() {
    // TODO: implement drecrementFavoriteCount
    throw UnimplementedError();
  }

  @override
  Future<void> incrementFavoriteCount() {
    // TODO: implement incrementFavoriteCount
    throw UnimplementedError();
  }
}