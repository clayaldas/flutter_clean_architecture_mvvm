import "package:dio/dio.dart"; //http

import '../error/api_error.dart'; //errores

class RemoteApiClient {
  // inicializar el objeto luego-después
  late Dio _dio;

  static RemoteApiClient init() {
    // Inicializar la clase con el constructor privado
    var apiClient = RemoteApiClient._();
    return apiClient;
  }

  // Constructor privado
  RemoteApiClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com',
        connectTimeout: const Duration(microseconds: 5000),
        receiveTimeout: const Duration(microseconds: 3000),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  // HTTP: GET
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(endPoint, queryParameters: queryParameters);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // HTT POST
  Future<Response> post(String endPoint, {dynamic data}) async {
    try {
      return await _dio.post(endPoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // HTTP DELETE
  Future<Response> delete(String endPoint, {dynamic data}) async {
    try {
      return await _dio.delete(endPoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }
}
