import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofoq/core/constants/supabase_keys.dart';
import 'package:ofoq/core/routes/app_router.dart';
import 'package:ofoq/core/theme/app_theme.dart';
import 'package:ofoq/core/providers/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseKeys.projectUrl,
    publishableKey: SupabaseKeys.publishableKey,
  );
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  final initialLocale = deviceLocale.languageCode.startsWith('ar')
      ? const Locale('ar')
      : const Locale('en');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: initialLocale,
      saveLocale: true,
      child: const ProviderScope(child: OFOQ()),
    ),
  );
}

class OFOQ extends ConsumerWidget {
  const OFOQ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'OFOQ',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: AppTheme.light(context.locale),
        darkTheme: AppTheme.dark(context.locale),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
