// Permite gestionar peticiones HTTP
import 'package:dio/dio.dart';

// Errores: HTTP
class ApiError {
  final String message;
  final int? statusCode;

  ApiError(this.message, {this.statusCode});

  factory ApiError.fromDioError(dynamic error) {
    if (error is DioException){
      return ApiError(
        error.response?.data['message']?? 'Ha ocurrido un error inesperado',
        statusCode: error.response?.statusCode,
      );
    }

    return ApiError('Error desconocido');
  }

  @override
  String toString() => 'ApiError: $message (status: $statusCode)';
}