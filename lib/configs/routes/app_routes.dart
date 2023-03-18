import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/initial_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/register_success_page.dart';
import '../../features/cards_management/presentation/pages/all_cards_page.dart';
import '../../features/topics_management/presentation/pages/all_topics_page.dart';
import '../../features/topics_management/presentation/pages/show_topic_detail_page.dart';

class AppRoutes {
  static String initial = '/initial';
  static String login = '/login';
  static String register = '/register';
  static String registerSuccess = '/register_success';
  static String allTopics = '/all_topics';
  static String allCards = '/all_cards';
  static String showTopicDetails = '/show_topic_details';
}

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    AppRoutes.initial: (_) => const InitialPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.registerSuccess: (_) => const RegisterSuccessPage(),
    AppRoutes.allTopics: (_) => const AllTopicsPage(),
    AppRoutes.allCards: (_) => const AllCardsPage(),
    AppRoutes.showTopicDetails: (_) => const ShowTopicDetailPage(),
  };
}
