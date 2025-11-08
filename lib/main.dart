import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc/bloc_observer.dart';
import 'config/di/di.dart';
// import 'core/services/local/app_storage/app_storage.dart';
import 'exam_app.dart';
import 'helper/is_user_login_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // getIt<AppStorage>().clear();
  Bloc.observer = MyBlocObserver();
  runApp(ExamApp(initialRoute: await isUserLogedIn()));
}
