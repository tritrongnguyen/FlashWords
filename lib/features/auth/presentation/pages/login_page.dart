import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../configs/styles/app_colors.dart';
import '../../../../configs/styles/app_texts.dart';
import '../../../../shared/widgets/submit_button.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var isShow = false;
  final facebookImg = 'assets/icons/facebook.png';
  final googleImg = 'assets/icons/google.png';
  final appleImg = 'assets/icons/apple.png';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticateWithEmailAndPassword() {
    BlocProvider.of<AuthBloc>(context).add(SignInRequested(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    ));
  }

  void _authenticateWithGoogleAccount() {
    BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.all_topics,
              );
            }
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.err)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 11, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 33,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Welcome back! Flash',
                          style: ralewayBold(
                            tSize: 30,
                            tColor: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'card',
                              style: ralewayBold(
                                tSize: 30,
                                tColor: AppColors.mediumPurple,
                              ),
                            ),
                            const TextSpan(
                              text: '\nto see you, Again!',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 53),
                      TextField(
                        controller: _emailController,
                        style: ralewayMedium(
                          tSize: 18,
                          tColor: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email',
                          fillColor: AppColors.azure,
                          filled: true,
                          hintStyle: ralewayMedium(
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
                        height: 18,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: !isShow,
                        obscuringCharacter: '●',
                        style: ralewayMedium(
                          tSize: 18,
                          tColor: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          fillColor: AppColors.azure,
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            icon: Icon(
                              isShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 25,
                              color: AppColors.dark,
                            ),
                          ),
                          hintStyle: ralewayMedium(
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
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 18, 0, 35),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: urbanistSemiBold(
                            tSize: 14,
                            tColor: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      SubmitButton(
                        text: 'Login',
                        event: _authenticateWithEmailAndPassword,
                        textStyle:
                            ralewayMedium(tSize: 17, tColor: Colors.white),
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
                                minimumSize: Size.fromHeight(65),
                              ),
                              child: Image.asset(
                                facebookImg,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: _authenticateWithGoogleAccount,
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size.fromHeight(65),
                              ),
                              child: Image.asset(
                                googleImg,
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
                                appleImg,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
