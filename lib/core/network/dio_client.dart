import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kursol/core/common/constants/api_urls.dart';
import 'package:kursol/core/utils/secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();
    _dio
      ..options.baseUrl = ApiUrls.baseURL
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger(compact: false))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final accessToken = await SecureStorage.getAccessToken();
            if (accessToken != null) {
              options.headers["Authorization"] = "Bearer $accessToken";
            }
            handler.next(options);
          },
          onError: (DioError e, handler) async {
            if (e.response?.statusCode == 401) {
              final newToken = await _refreshToken();
              if (newToken != null) {
                e.requestOptions.headers["Authorization"] = "Bearer $newToken";
                final retryResponse = await _dio.request(
                  e.requestOptions.path,
                  options: Options(
                    method: e.requestOptions.method,
                    headers: e.requestOptions.headers,
                  ),
                  data: e.requestOptions.data,
                );
                return handler.resolve(retryResponse);
              }
            }
            handler.next(e);
          },
        ),
      );
  }

  // ✅ Auto-Refresh Access Token
  Future<String?> _refreshToken() async {
    final refreshToken = await SecureStorage.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _dio.post(ApiUrls.refreshToken, data: {
        "refreshToken": refreshToken,
      });

      if (response.statusCode == 200) {
        final newToken = response.data["accessToken"];
        await SecureStorage.saveAccessToken(newToken);
        return newToken;
      }
      return null;
    } catch (e) {
      return null;
    }
  }


  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress}) async {
    return await _dio.get(url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }


  Future<Response<dynamic>> post(String url,
      {Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress}) async {
    return await _dio.post(url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }
}
