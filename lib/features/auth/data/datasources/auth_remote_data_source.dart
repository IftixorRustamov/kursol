import 'package:dio/dio.dart';
import 'package:kursol/core/common/constants/api_urls.dart';

import '../../../../core/utils/logger/app_logger.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<bool> register(Map<String, dynamic> data, bool useEmail);
  Future<bool> verifyOtp(String otp);
  Future<bool> logout();
  Future<String?> refreshAccessToken(String refreshToken);
  Future<bool> resetPassword(Map<String, dynamic> data);
  Future<bool> sendOtpForPasswordReset(String identifier, bool isPhone);
  Future<Map<String, dynamic>> processGoogleGrantCode(String code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        ApiUrls.login,
        data: {
          "username": username,
          "password": password
        },
      );

      logger.i("📢 Status Code: ${response.statusCode}");
      logger.i("📢 Raw Response: ${response.data}");

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw Exception("Login failed: Unexpected response format");
      }
    } catch (e) {
      logger.e("🔥 API Error: $e");
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>> processGoogleGrantCode(String code) async {
    try {
      final response = await _dioClient.get(
        ApiUrls.grantCode,
        queryParameters: {"code": code},
      );

      logger.i("📢 Google Login - Status Code: ${response.statusCode}");
      logger.i("📢 Google Login - Raw Response: ${response.data}");

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final data = response.data["data"];
        if (data == null) {
          throw Exception("Google Sign-in failed: 'data' bo‘limi yo‘q!");
        }

        return {
          "accessToken": data["accessToken"],
          "refreshToken": data["refreshToken"],
          "user": data["user"],
        };
      } else {
        throw Exception("Google Sign-in failed: Unexpected response format");
      }
    } catch (e) {
      logger.e("🔥 Google Sign-in API Error: $e");
      throw Exception("Google Sign-in failed: ${e.toString()}");
    }
  }

  @override
  Future<bool> register(Map<String, dynamic> data, bool useEmail) async {
    final url = useEmail ? ApiUrls.registerEmail : ApiUrls.registerPhone;
    final response = await _dioClient.post(url, data: data);
    return response.statusCode == 200;
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    final response = await _dioClient.post(
      ApiUrls.verifyOtp,
      queryParameters: {"otp": otp},
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> logout() async {
    final response = await _dioClient.post(ApiUrls.logout);
    return response.statusCode == 200;
  }

  @override
  Future<String?> refreshAccessToken(String refreshToken) async {
    final response = await _dioClient.post(
      ApiUrls.refreshToken,
      data: {"refreshToken": refreshToken},
    );
    if (response.statusCode == 200) {
      return response.data["accessToken"];
    }
    return null;
  }

  @override
  Future<bool> resetPassword(Map<String, dynamic> data) async {
    final response = await _dioClient.put(ApiUrls.resetPassword, data: data);
    return response.statusCode == 200;
  }

  @override
  Future<bool> sendOtpForPasswordReset(String identifier, bool isPhone) async {
    final url = isPhone ? ApiUrls.resetPasswordPhone : ApiUrls.resetPasswordEmail;
    final response = await _dioClient.post(url, data: {isPhone ? "phone" : "email": identifier});
    return response.statusCode == 200;
  }
}
