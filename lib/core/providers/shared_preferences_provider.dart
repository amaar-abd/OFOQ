import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/core/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    FutureProvider<SharedPreferencesService>((ref) async {
      final prefs = await SharedPreferences.getInstance();
      return SharedPreferencesService(prefs);
    });
