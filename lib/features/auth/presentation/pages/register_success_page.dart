import 'package:flutter/material.dart';

import '../../../../configs/env/imgs_path.dart';
import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_texts.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImgsPath.successMarkSticker,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    Text(
                      'Register Successful!',
                      style: ralewayBold(
                        tSize: 30,
                        tColor: AppColors.dark,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      'Your account has been created \nsuccessfully',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGray,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(65),
                        backgroundColor: AppColors.mediumPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Back to Login',
                        style: ralewayMedium(
                          tSize: 17,
                          tColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
