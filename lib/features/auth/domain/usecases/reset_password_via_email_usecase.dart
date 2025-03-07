import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordViaEmailUsecase {
  final AuthRepository _authRepository;

  ResetPasswordViaEmailUsecase(this._authRepository);

  Future<ApiResponse<void>> call(String email) async {
    if (email.isEmpty) {
      throw Exception('Email cannot be empty');
    }
    return await _authRepository.resetPasswordViaEmail(email);
  }
}
