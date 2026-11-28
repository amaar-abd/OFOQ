import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/core/providers/supabase_provider.dart';
import 'package:ofoq/features/authentication/data/datasources/auth_remote_data_source.dart';

final authRemoteDataSourceProvideer = Provider<AuthRemoteDataSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthRemoteDataSource(client);
});
