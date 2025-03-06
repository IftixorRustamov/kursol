import 'package:kursol/features/auth/domain/entities/token_entity.dart';

import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository _authRepository;

  RefreshTokenUseCase(this._authRepository);

  Future<ApiResponse<TokenEntity>> call(String refreshToken) async {
    if (refreshToken.isEmpty) {
      throw Exception('Refresh token cannot be empty');
    }
    return await _authRepository.refreshToken(refreshToken);
  }
}
