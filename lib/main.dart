import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/config/routes/route.dart';
import 'package:jobspot/config/themes/app_theme.dart';
import 'package:jobspot/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:jobspot/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:jobspot/features/user/presentation/pages/check_your_email_page.dart';
import 'package:jobspot/features/user/presentation/pages/on_boarding_page.dart';
import 'package:jobspot/injection_container.dart' as di;


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: '/onboarding',
        routes: {
          "/" :(context){
            return BlocBuilder<AuthCubit, AuthState>
            (builder: (context, authState){
              if (authState is Authenticated) {
                return const Placeholder();
              } else {
                return const OnboardingPage();
              }
            });
          }
        },
      ),
    );
  }
}
