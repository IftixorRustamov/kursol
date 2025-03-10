import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';

class GetGrantCodeUseCase {
  final AuthRepository repository;

  GetGrantCodeUseCase(this.repository);

  Future<User> call(String code) async {
    return await repository.processGoogleGrantCode(code);
  }
}
