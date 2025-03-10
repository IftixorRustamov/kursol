import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  Future<String?> call(String refreshToken) async {
    return await repository.refreshAccessToken(refreshToken);
  }
}
