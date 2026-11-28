import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';
import 'package:ofoq/features/authentication/presentation/providers/auth_remote_data_source_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvideer);

  return AuthRepositoryImpl(remoteDataSource);
});
