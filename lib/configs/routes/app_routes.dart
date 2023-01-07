import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/initial_page.dart';
import '../../pages/login_page.dart';
import '../../pages/register_page.dart';
import '../../pages/register_success_page.dart';

class AppRoutes {
  static String initial = '/initial';
  static String login = '/login';
  static String register = '/register';
  static String register_success = '/register_success';
  static String home = '/home';
}

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    AppRoutes.initial: (_) => const InitialPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.register_success: (_) => const RegisterSuccessPage(),
    AppRoutes.home: (_) => const HomePage(),
  };
}
