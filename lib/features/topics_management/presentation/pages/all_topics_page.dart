import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../configs/styles/app_texts.dart';
import '../../../../service_locator.dart';
import '../../../../shared/widgets/circular_fab.dart';
import '../../../../shared/widgets/my_navigation_drawer.dart';
import '../../../user_management/presentation/bloc/user_management_bloc.dart';
import '../bloc/topics_management_bloc.dart';
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
    BlocProvider.of<TopicsManagementBloc>(context)
        .add(TopicsGetAllEvent(uid: sl<FirebaseAuth>().currentUser!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Topics',
          style: ralewaySemibold(
            tSize: 26,
            tColor: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: BlocBuilder<UserManagementBloc, UserManagementState>(
        builder: (context, state) {
          if (state is UserManagementSucceeded) {
            return MyNavigationDrawer(firebaseUser: state.user);
          }

          return const MyNavigationDrawer(firebaseUser: null);
        },
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<TopicsManagementBloc, TopicsManagementState>(
          builder: (context, state) {
            if (state is TopicsGetAllSucceed) {
              return ListView.builder(
                itemCount: state.topics.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.topics.length) {
                    return const SizedBox(
                      height: 20,
                    );
                  }

                  return TopicCover(
                    topicColor:
                        Color(int.parse(state.topics[index].colorValue)),
                    topicTitle: state.topics[index].title,
                  );
                },
              );
            }
            if (state is TopicsManagementFailed) {
              return Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 100)),
                    LottieBuilder.asset(
                      'assets/lotties/nodata_lottie.json',
                      fit: BoxFit.fill,
                    ),
                    Text(
                      state.err,
                      style: ralewayMedium(
                        tSize: 18,
                        tColor: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: const CircularFab(),
    );
  }
}
