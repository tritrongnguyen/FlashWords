import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("FlashWords"),
        ),
        body: const Center(
          child: Text("A Tri dep trai"),
        ),
      ),
    );
  }
}
