import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:jobspot/feature/presentation/bloc/user/user_cubit.dart';

import 'feature/presentation/resources/routes_manager.dart';
import 'feature/presentation/resources/theme_manager.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>()..appStarted()),
        BlocProvider<UserCubit>(create: (_) => di.getIt<UserCubit>()),
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
      ),
    );
  }
}
