import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/routes/app_routes.dart';
import '../../configs/styles/app_colors.dart';
import '../../configs/styles/app_texts.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../features/user_management/domain/entities/firebase_user.dart';

class NavigationDrawer extends StatefulWidget {
  final FirebaseUser? firebaseUser;

  const NavigationDrawer({super.key, required this.firebaseUser});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.mediumPurple,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 45,
                            child: Text(
                              widget.firebaseUser?.userName
                                      ?.substring(0, 1)
                                      .toUpperCase() ??
                                  'U',
                              style:
                                  ralewayBold(tSize: 50, tColor: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          widget.firebaseUser?.userName ?? "Undefined",
                          style: ralewayMedium(tSize: 25, tColor: Colors.white),
                        ),
                        Text(
                          widget.firebaseUser?.email ?? "Undefined",
                          style: ralewayMedium(tSize: 17, tColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.topic_outlined,
                  color: AppColors.mediumPurple,
                  size: 48,
                ),
                title: Text(
                  'All topics',
                  style: ralewaySemibold(
                    tSize: 24,
                    tColor: AppColors.mediumPurple,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.all_topics,
                  );
                },
              ),
              ListTile(
                leading: Transform.rotate(
                  angle: 180 * 3.14 / 290,
                  child: Icon(
                    Icons.style_outlined,
                    color: AppColors.mediumPurple,
                    size: 48,
                  ),
                ),
                title: Text(
                  'All cards',
                  style: ralewaySemibold(
                    tSize: 24,
                    tColor: AppColors.mediumPurple,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.all_cards);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: AppColors.mediumPurple,
                  size: 48,
                ),
                title: Text(
                  'Most used topics',
                  style: ralewaySemibold(
                    tSize: 24,
                    tColor: AppColors.mediumPurple,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: AppColors.mediumPurple,
                  size: 48,
                ),
                title: Text(
                  'Trash',
                  style: ralewaySemibold(
                    tSize: 24,
                    tColor: AppColors.mediumPurple,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).pop();
                },
              ),
              const Divider(
                color: Colors.black54,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: AppColors.mediumPurple,
                  size: 48,
                ),
                title: Text(
                  'Log out',
                  style: ralewaySemibold(
                    tSize: 24,
                    tColor: AppColors.mediumPurple,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
                  Navigator.of(context).pushReplacementNamed(AppRoutes.initial);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
