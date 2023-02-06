import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/initial_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/register_success_page.dart';
import '../../features/cards_management/presentation/pages/all_cards_page.dart';
import '../../features/topics_management/presentation/pages/all_topics_page.dart';

class AppRoutes {
  static String initial = '/initial';
  static String login = '/login';
  static String register = '/register';
  static String register_success = '/register_success';
  static String all_topics = '/all_topics';
  static String all_cards = '/all_cards';
}

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    AppRoutes.initial: (_) => const InitialPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.register_success: (_) => const RegisterSuccessPage(),
    AppRoutes.all_topics: (_) => const AllTopicsPage(),
    AppRoutes.all_cards: (_) => const AllCardsPage(),
  };
}
