import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<ApiResponse<TokenEntity>> login(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithEmail(String email, String password, String firstName, String lastName) {
    throw UnimplementedError();
  }

  @override
  UserEntity? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TokenEntity>> getGrantCode(String grantCode) {
    // TODO: implement getGrantCode
    throw UnimplementedError();
  }

  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TokenEntity>> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithPhone(String phoneNumber, String password, String firstName, String lastName) {
    // TODO: implement registerWithPhone
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPassword(String otpCode, List<String> newPassword, List<String> confirmPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaEmail(String email) {
    // TODO: implement resetPasswordViaEmail
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaPhone(String phone) {
    // TODO: implement resetPasswordViaPhone
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> verifyOtp(String otpCode) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

}
