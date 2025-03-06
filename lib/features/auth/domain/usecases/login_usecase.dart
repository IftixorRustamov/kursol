import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

import '../entities/api_response_entity.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  Future<ApiResponse<TokenEntity>> call(
      String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password cannot be empty');
    }
    return await _authRepository.login(username, password);
  }
}
