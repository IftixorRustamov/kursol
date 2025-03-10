import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:kursol/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:kursol/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';


final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSourceImpl(dio);
});


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});


class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _authRepository;
  AuthNotifier(this._authRepository) : super(const AsyncValue.data(false));

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.login(username, password);
      state = const AsyncValue.data(true);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.logout();
      state = const AsyncValue.data(false);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
