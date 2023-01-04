import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/firebase_auth_bloc/firebase_auth_bloc.dart';
import 'configs/routes/app_routes.dart';
import 'configs/styles/app_colors.dart';
import 'services/firebase_auth_service.dart';

Future<void> main() async {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<FirebaseAuthBloc>(
            create: (context) => FirebaseAuthBloc(
              firebaseAuthService: FirebaseAuthService(),
            ),
          ),
        ],
        child: MyApp(),
      ),
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
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
