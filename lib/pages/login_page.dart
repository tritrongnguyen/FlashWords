import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const top_bg = 'assets/images/login_page_images/top_bg.png';
    const bottom_bg = 'assets/images/login_page_images/bottom_bg.png';

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: [
                Image.asset(top_bg),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Text("Hello"),
          )),
          Container(
            child: Image.asset(bottom_bg),
          )
        ],
      ),
    );
  }
}
