import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/router/app_router/go_router.dart';
import 'core/themes/app_theme.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key, this.initialRoute});
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.initialize(initialRoute: initialRoute),
        theme: AppThemes.light(),
        darkTheme: AppThemes.dark(),
        themeMode: ThemeMode.light,
        builder: EasyLoading.init(),
      ),
    );
  }
}
