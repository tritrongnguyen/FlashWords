import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../../../shared/widgets/navigation_drawer.dart';
import '../../../user_management/presentation/bloc/user_management_bloc.dart';

class AllCardsPage extends StatefulWidget {
  const AllCardsPage({Key? key}) : super(key: key);

  @override
  _AllCardsPageState createState() => _AllCardsPageState();
}

class _AllCardsPageState extends State<AllCardsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserManagementBloc>(context)
        .add(GetUserByUidRequested(uid: sl<FirebaseAuth>().currentUser!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All cards page'),
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
    );
  }
}
