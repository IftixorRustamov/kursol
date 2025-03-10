import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<bool> register(Map<String, dynamic> data, bool useEmail);
  Future<bool> verifyOtp(String otp);
  Future<bool> logout();
  Future<String?> refreshAccessToken(String refreshToken);
  Future<bool> resetPassword(Map<String, dynamic> data);
  Future<bool> sendOtpForPasswordReset(String identifier, bool isPhone);
  Future<User> processGoogleGrantCode(String code);
}
