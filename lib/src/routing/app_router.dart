import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/weather/presentation/presentation_exports.dart';
import 'app_routes.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.weatherPage.name,
        builder: (context, state) => const WeatherPage(),
      ),
    ],
  ),
);
