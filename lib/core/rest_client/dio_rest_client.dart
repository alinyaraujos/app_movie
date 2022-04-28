import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/core/helpers/environments.dart';
import 'package:app_movie/core/rest_client/rest_client_excepetion.dart';
import 'package:app_movie/core/rest_client/rest_client_response.dart';
import 'rest_client.dart';

class DioRestClient implements RestClient {
  static late Dio _dio;

  final _options = BaseOptions(
    baseUrl: Environments.param('base_url') ?? '',
    connectTimeout: int.parse(Environments.param('dio_connectTimeout') ?? '0'),
    receiveTimeout: int.parse(Environments.param('dio_receiveTimeout') ?? '0'),
  );

  DioRestClient({
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? _options);
    _dio.interceptors.addAll([
      LogInterceptor(),
    ]);
  }

  static Dio getDioCliente()  {
    return _dio;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _dioConverter(response);
    } on DioError catch (e) {
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(path,
          queryParameters: queryParameters,
          options: headers != null ? Options(headers: headers) : null);
      return _dioConverter(response);
    } on DioError catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return RestClientResponse<T>(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return RestClientResponse<T>(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return RestClientResponse<T>(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String path, {
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers, method: method));
      return _dioConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(e.response?.statusMessage,
          e.response?.statusCode, e.error, _dioErrorConverter(e.response));
    }
  }

  RestClientResponse<T> _dioConverter<T>(Response<T> response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  RestClientResponse<T> _dioErrorConverter<T>(Response<T>? response) {
    return RestClientResponse<T>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}
