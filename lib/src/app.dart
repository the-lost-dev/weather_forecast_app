import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/config_exports.dart';
import 'routing/app_router.dart';

/// The Widget that configures your application.
class WeatherApp extends ConsumerWidget {
  const WeatherApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final theme = WeatherTheme.weatherTheme();
    return MaterialApp.router(
      theme: theme,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
    );
  }
}
