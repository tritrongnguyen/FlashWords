import 'package:flutter/material.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_texts.dart';
import '../../../../widgets/shared/submit_button.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const topBackground = 'assets/images/login_page_images/top_bg.png';
    const botBackGround = 'assets/images/login_page_images/bottom_bg.png';

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                topBackground,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          text: 'Flash',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: 'Cards',
                              style: TextStyle(
                                color: Colors.purple[300],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      children: [
                        SubmitButton(
                          text: 'Login',
                          event: () {
                            Navigator.of(context).pushNamed(AppRoutes.login);
                          },
                          textStyle: ralewayMedium(
                            tSize: 17,
                            tColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.register);
                          },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size.fromHeight(63),
                              side: const BorderSide(color: Color(0xFF6A74CF)),
                              backgroundColor: Colors.white),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xFF1E232C),
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                botBackGround,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
