import 'package:dio/dio.dart';

/// Global `Rest` Client Stub
abstract class RestClient {
  static const String name = 'RestClient';

  /// Call this to make a `GET` request
  Future<T?> get<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParams,
  });

  /// Call this to make a `POST` request
  Future<T?> post<T>(
    String url, {
    Map<String, String> headers = const {},
    body,
    Map<String, dynamic>? queryParams,
  });

  /// Call this to make a `PATCH` request
  Future<T?> patch<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
  });

  /// Call this to make a `PUT` request
  Future<T?> put<T>(
    String url, {
    Map<String, String> headers = const {},
    body,
    Map<String, dynamic>? queryParams,
  });

  Future<T?> uploadFile<T>(
    String url,
    String filePath, {
    String? fileName,
  });

  Future<dynamic> downloadFile(
    String url,
    String? savePath, {
    Map<String, String> headers = const {},
    ProgressCallback? onReceiveProgress,
  });

  /// Call this to make a `DELETE` request
  Future<T?> delete<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParams,
  });

  /// Call this to cancel all `Requests` including
  /// `queued` onces
  // void cancelAllRequests();

  @override
  String get moduleName => name;
}
