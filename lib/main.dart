import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/routes/app_routes.dart';
import 'configs/styles/app_colors.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/user_management/presentation/bloc/user_management_bloc.dart';
import 'firebase_options.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<UserManagementBloc>(
          create: (context) => sl<UserManagementBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.mediumPurple,
        fontFamily: 'Raleway',
      ),
      initialRoute: AppRoutes.initial,
      routes: buildRoutes(),
    );
  }
}
