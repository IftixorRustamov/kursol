import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  ResetPasswordUseCase(this._authRepository);

  Future<ApiResponse<void>> call(
    String otpCode,
    List<String> newPassword,
    List<String> confirmPassword,
  ) async {
    if (otpCode.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    if (newPassword != confirmPassword) {
      throw Exception('Passwords do not match');
    }
    return await _authRepository.resetPassword(
        otpCode, newPassword, confirmPassword);
  }
}
