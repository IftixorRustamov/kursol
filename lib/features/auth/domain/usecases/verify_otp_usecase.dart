import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _authRepository;

  const VerifyOtpUseCase(this._authRepository);

  Future<ApiResponse<void>> call(String otpCode) async {
    if (otpCode.isEmpty) {
      throw Exception('OTP code cannot be empty');
    }
    return await _authRepository.verifyOtp(otpCode);
  }
}
