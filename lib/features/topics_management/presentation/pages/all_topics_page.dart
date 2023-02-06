import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/styles/app_colors.dart';
import '../../../../service_locator.dart';
import '../../../../shared/widgets/navigation_drawer.dart';
import '../../../user_management/presentation/bloc/user_management_bloc.dart';
import '../widgets/topic_cover.dart';

class AllTopicsPage extends StatefulWidget {
  const AllTopicsPage({Key? key}) : super(key: key);

  @override
  _AllTopicsPageState createState() => _AllTopicsPageState();
}

class _AllTopicsPageState extends State<AllTopicsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserManagementBloc>(context)
        .add(GetUserByUidRequested(uid: sl<FirebaseAuth>().currentUser!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('All topics page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: BlocBuilder<UserManagementBloc, UserManagementState>(
        builder: (context, state) {
          if (state is UserManagementSucceeded) {
            return NavigationDrawer(firebaseUser: state.user);
          }

          return const NavigationDrawer(firebaseUser: null);
        },
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopicCover(
                topicColor: AppColors.darkBlue,
                topicTitle: 'School',
              ),
              TopicCover(
                topicColor: AppColors.mediumPurple,
                topicTitle: 'Factory',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
