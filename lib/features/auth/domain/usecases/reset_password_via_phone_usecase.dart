import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordViaPhoneUsecase {
  final AuthRepository _authRepository;

  ResetPasswordViaPhoneUsecase(this._authRepository);

  Future<ApiResponse<void>> call(String phone) async {
    if (phone.isEmpty) {
      throw Exception('Phone number cannot be empty');
    }
    return await _authRepository.resetPasswordViaPhone(phone);
  }
}
