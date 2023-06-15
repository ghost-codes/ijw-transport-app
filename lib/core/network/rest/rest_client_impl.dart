import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ijw_transport_app/core/network/rest/rest_client.dart';

import '../network_error.dart';
import 'intercepters/network_error_interceptor.dart';

/// Global `Rest` Client Stub Implementation
class RestClientImpl extends RestClient {
  RestClientImpl(
    String baseUrl,
    this.onNetworkError, {
    Dio? dioInstance,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) {
    _dioInstance = dioInstance ??
        Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ));

    _dioInstance.interceptors.add(
      NetworkErrorInterceptor(onNetworkError),
    );
  }

  late Dio _dioInstance;
  final Function(NetworkError error) onNetworkError;

  @override
  Future<T?> patch<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioInstance.patch<T>(
        url,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<T?> post<T>(
    String url, {
    Map<String, String> headers = const {},
    body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioInstance.post<T>(
        url,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<T?> put<T>(
    String url, {
    Map<String, String> headers = const {},
    body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioInstance.put(
        url,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<T?> delete<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioInstance.delete(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<T?> get<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioInstance.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<T?> uploadFile<T>(
    String url,
    String filePath, {
    String? fileName,
  }) async {
    final file = File(filePath);
    try {
      final response = await _dioInstance.put(
        url,
        data: file.openRead(),
        options: Options(
          contentType: 'image/jpeg',
          headers: {
            'Content-Length': file.lengthSync(),
          },
        ),
      );

      return response.data;
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }

  @override
  Future<dynamic> downloadFile(
    String url,
    String? savePath, {
    Map<String, String> headers = const {},
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _dioInstance.download(
        url,
        savePath,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
        deleteOnError: true,
      );
    } on DioError catch (e) {
      throw NetworkError.fromDio(e);
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:loyalty/core/network/http_client.dart';
// import 'package:loyalty/core/network/http_response.dart';

// class RestClient {
//   final HttpClient _httpClient;

//   RestClient({required HttpClient httpClient}) : _httpClient = httpClient;


//   Future<HttpResponse> getData(String path, {Map<String, dynamic>? queryParams}) async {
//     final response = await _httpClient.execute(
//       path: path,
//       method: "GET",
//       query: queryParams,
//     );
//     return response;
//   }

//   Future<HttpResponse> postData(String path, Map<String, dynamic> data) async {
//     final response = await _httpClient.execute(
//       method: "POST",
//       path: path,
//       data: data,
//     );
//     return response;
//   }

//   Future<HttpResponse> postImage(String path, FormData data) async {
//     final response = await _httpClient.execute(
//       method: "POST",
//       path: path,
//       data: data,
//       contentType: "multipart/form-data",
//     );
//     return response;
//   }

//   Future<HttpResponse> putData(String path, Map<String, dynamic> data) async {
//     final response = await _httpClient.execute(
//       method: "PUT",
//       path: path,
//       data: data,
//     );
//     return response;
//   }

//   Future<HttpResponse> deleteData(String path, Map<String, dynamic> data) async {
//     final response = await _httpClient.execute(
//       method: "DELETE",
//       path: path,
//     );
//     return response;
//   }
// }
