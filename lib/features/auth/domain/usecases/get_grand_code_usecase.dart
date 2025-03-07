import 'package:kursol/features/auth/domain/entities/token_entity.dart';

import '../entities/api_response_entity.dart';
import '../repositories/auth_repository.dart';

class GetGrantCodeUsecase {
  final AuthRepository _authRepository;

  GetGrantCodeUsecase(this._authRepository);

  Future<ApiResponse<TokenEntity>> call(String grantCode) async {
    if (grantCode.isEmpty) {
      throw Exception('Grant code cannot be empty');
    }
    return await _authRepository.getGrantCode(grantCode);
  }
}
