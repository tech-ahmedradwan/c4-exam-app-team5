// ignore_for_file: curly_braces_in_flow_control_structures

import '../config/di/di.dart';
import '../core/constants/app_routes/app_routes.dart';
import '../core/constants/cache_keys/app_cache_keys.dart';
import '../core/services/local/app_storage/app_storage.dart';

Future<String> isUserLogedIn() async {
  final String? token = await getIt<AppStorage>().getSecure(
    AppCacheKeys.userTokenKey,
  );
  final bool rememberMe =
      getIt<AppStorage>().getBool(AppCacheKeys.rememberMeKey) ?? false;
  if (token != null && token.isNotEmpty && rememberMe)
    return AppRoutes.homeRoute;
  else
    return AppRoutes.signInRoute;
}
