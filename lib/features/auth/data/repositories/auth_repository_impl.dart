import 'package:dio/dio.dart';
import 'package:kursol/core/network/dio_client.dart';
import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/core/common/constants/api_urls.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient _dioClient;

  AuthRepositoryImpl(this._dioClient);

  @override
  Future<ApiResponse<void>> resetPassword(
      String otpCode, String newPassword, String confirmPassword) async {
    try {
      final response = await _dioClient.put(ApiUrls.resetPassword, data: {
        "otp": otpCode,
        "newPassword": [newPassword],
        "confirmPassword": [confirmPassword],
      });

      return ApiResponse(success: response.statusCode == 200);
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaEmail(String email) async {
    try {
      final response = await _dioClient.post(ApiUrls.resetPasswordEmail, data: {
        "email": email,
      });

      return ApiResponse(success: response.statusCode == 200);
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaPhone(String phone) async {
    try {
      final response = await _dioClient.post(ApiUrls.resetPasswordPhone, data: {
        "phone": phone,
      });

      return ApiResponse(success: response.statusCode == 200);
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<TokenEntity>> refreshToken(String refreshToken) async {
    try {
      final response = await _dioClient.post(ApiUrls.refreshToken, data: {
        "refreshToken": refreshToken,
      });

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: TokenEntity.fromJson(response.data));
      } else {
        return ApiResponse(success: false, error: ApiError.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<TokenEntity>> login(String username, String password) async {
    try {
      final response = await _dioClient.post(ApiUrls.login, data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: TokenEntity.fromJson(response.data));
      } else {
        return ApiResponse(success: false, error: ApiError.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<void>> logout() async {
    try {
      final response = await _dioClient.post(ApiUrls.logout);

      return ApiResponse(success: response.statusCode == 200);
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithEmail(
      String email, String password, String firstName, String lastName) async {
    try {
      final response = await _dioClient.post(ApiUrls.registerWithEmail, data: {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      });

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: UserEntity.fromJson(response.data["data"]));
      } else {
        return ApiResponse(success: false, error: ApiError.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithPhone(
      String phoneNumber, String password, String firstName, String lastName) async {
    try {
      final response = await _dioClient.post(ApiUrls.registerWithPhone, data: {
        "phoneNumber": phoneNumber,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      });

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: UserEntity.fromJson(response.data["data"]));
      } else {
        return ApiResponse(success: false, error: ApiError.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<TokenEntity>> getGrantCode(String grantCode) async {
    try {
      final response = await _dioClient.get(ApiUrls.getGrantCode, queryParameters: {
        "code": grantCode,
      });

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: TokenEntity.fromJson(response.data["data"]));
      } else {
        return ApiResponse(success: false, error: ApiError.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  Future<ApiResponse<void>> verifyOtp(String otpCode) async {
    try {
      final response = await _dioClient.post(ApiUrls.verifyOtp, data: {
        "otp": otpCode,
      });

      return ApiResponse(success: response.statusCode == 200);
    } on DioException catch (e) {
      return ApiResponse(success: false, error: ApiError(code: "500", message: e.message ?? "Unknown error"));
    }
  }

  @override
  UserEntity? getCurrentUser() {
    // TODO: Implement local storage logic to get saved user
    throw UnimplementedError();
  }

  @override
  bool isUserLoggedIn() {
    // TODO: Implement logic to check if user is logged in
    throw UnimplementedError();
  }
}
