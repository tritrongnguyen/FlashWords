import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../configs/routes/app_routes.dart';
import '../configs/styles/app_texts.dart';
import '../widgets/shared/submit_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut() {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as HomePageArguments;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context).popAndPushNamed(AppRoutes.login);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(args.user.email!),
              const SizedBox(
                height: 30,
              ),
              SubmitButton(
                text: 'Sign out',
                event: _signOut,
                textStyle: ralewayMedium(tSize: 17, tColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageArguments {
  final User user;

  HomePageArguments({required this.user});
}
