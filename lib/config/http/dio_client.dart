import 'package:dio/dio.dart';

class DioClient {

  final Dio _dio;

  DioClient(this._dio) {
    _dio
    ..options.baseUrl         = 'https://dummyjson.com/products'
    ..options.connectTimeout  = const Duration( minutes: 5 )
    ..options.receiveTimeout  = const Duration( minutes: 5 )
    ..options.responseType    = ResponseType.json;
  }

  post<T>( String url, { Map<String, dynamic>? data, Options? options } ) async {
    return _dio.post<T>(url, data: data, options: options );
  }

  get<T>( String url ) async {
    return _dio.get<T>( url );
  }
  
}
