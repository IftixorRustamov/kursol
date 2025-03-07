import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<ApiResponse<void>> resetPassword(
      String otpCode,
      String newPassword, // O‘zgartirildi
      String confirmPassword, // O‘zgartirildi
      );

  Future<ApiResponse<void>> resetPasswordViaPhone(String phone);
  Future<ApiResponse<void>> resetPasswordViaEmail(String email);
  Future<ApiResponse<UserEntity>> registerWithPhone(
      String phoneNumber,
      String password,
      String firstName,
      String lastName,
      );
  Future<ApiResponse<UserEntity>> registerWithEmail(
      String email,
      String password,
      String firstName,
      String lastName,
      );
  Future<ApiResponse<TokenEntity>> refreshToken(String refreshToken);
  Future<ApiResponse<void>> verifyOtp(String otpCode);
  Future<ApiResponse<void>> logout();
  Future<ApiResponse<TokenEntity>> login(String username, String password);
  Future<ApiResponse<TokenEntity>> getGrantCode(String grantCode);
  UserEntity? getCurrentUser();
  bool isUserLoggedIn();
}
