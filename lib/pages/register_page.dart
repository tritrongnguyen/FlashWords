import 'package:flutter/material.dart';

import '../configs/env/imgs_path.dart';
import '../configs/routes/app_routes.dart';
import '../configs/styles/app_colors.dart';
import '../configs/styles/app_texts.dart';
import '../widgets/shared/submit_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 11, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: AppColors.lightGray,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: AppColors.dark,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Hello! Register to get started',
                  style: urbanistBold(
                    tSize: 29,
                    tColor: AppColors.dark,
                  ),
                ),
                // const SizedBox(
                //   height: 95,
                // ),
                SizedBox(
                  height: 95,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/welcome.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Username
                TextField(
                  controller: _userController,
                  style: urbanistMedium(
                    tSize: 18,
                    tColor: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: urbanistMedium(
                      tSize: 15,
                      tColor: AppColors.darkGray,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.darkGray.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Email
                TextField(
                  controller: _emailController,
                  style: urbanistMedium(
                    tSize: 18,
                    tColor: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: urbanistMedium(
                      tSize: 15,
                      tColor: AppColors.darkGray,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.darkGray.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '●',
                  style: urbanistMedium(
                    tSize: 18,
                    tColor: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: urbanistMedium(
                      tSize: 15,
                      tColor: AppColors.darkGray,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.darkGray.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Confirm password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  obscuringCharacter: '●',
                  style: urbanistMedium(
                    tSize: 18,
                    tColor: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm Password',
                    hintStyle: urbanistMedium(
                      tSize: 15,
                      tColor: AppColors.darkGray,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.darkGray.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SubmitButton(
                  text: 'Register',
                  event: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.register_success);
                  },
                  textStyle: urbanistSemiBold(
                    tSize: 15,
                    tColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 41,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Flexible(
                      flex: 1,
                      child: Divider(),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Or Login with',
                        textAlign: TextAlign.center,
                        style: urbanistMedium(
                          tSize: 14,
                          tColor: AppColors.darkGray,
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Divider(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(65),
                        ),
                        child: Image.asset(
                          ImgsPath.facebookSticker,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(65),
                        ),
                        child: Image.asset(
                          ImgsPath.googleSticker,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(65),
                        ),
                        child: Image.asset(
                          ImgsPath.appleSticker,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
