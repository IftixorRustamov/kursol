import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  //? (PUT /v1/auth/reset-password)
  Future<ApiResponse<void>> resetPassword(
    String otpCode,
    List<String> newPassword,
    List<String> confirmPassword,
  );

  //? (POST /v1/auth/reset-password/phone)
  Future<ApiResponse<void>> resetPasswordViaPhone(String phone);

  //? (POST /v1/auth/reset-password/email)
  Future<ApiResponse<void>> resetPasswordViaEmail(String email);

  //? (POST /v1/auth/register/phone)
  Future<ApiResponse<UserEntity>> registerWithPhone(
    String phoneNumber,
    String password,
    String firstName,
    String lastName,
  );

  //? (POST /v1/auth/register/email)
  Future<ApiResponse<UserEntity>> registerWithEmail(
    String email,
    String password,
    String firstName,
    String lastName,
  );

  //? (POST /v1/auth/refresh-token)
  Future<ApiResponse<TokenEntity>> refreshToken(String refreshToken);

  //? (POST /v1/auth/otp-verification)
  Future<ApiResponse<void>> verifyOtp(String otpCode);

  //? (POST /v1/auth/logout)
  Future<ApiResponse<void>> logout();

  //? (POST /v1/auth/login)
  Future<ApiResponse<TokenEntity>> login(String username, String password);

  //? (GET /v1/auth/grant-code)
  Future<ApiResponse<TokenEntity>> getGrantCode(String grantCode);

  UserEntity? getCurrentUser();

  bool isUserLoggedIn();
}
