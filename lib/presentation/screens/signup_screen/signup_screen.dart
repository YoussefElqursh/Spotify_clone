import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/screens/home_screen/home_screen.dart';
import 'package:spotify/presentation/screens/signin_screen/signin_screen.dart';
import 'package:spotify/presentation/widgets/app_bar_widget.dart';
import 'package:spotify/presentation/widgets/common_btn_widget.dart';
import 'package:spotify/service_locator.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                ).applyDefaults(
                  Theme
                      .of(context)
                      .inputDecorationTheme,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                ).applyDefaults(
                  Theme
                      .of(context)
                      .inputDecorationTheme,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ).applyDefaults(
                  Theme
                      .of(context)
                      .inputDecorationTheme,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              commonBtn(
                title: 'Sign Up',
                onPressed: () async {
                  var result = await s1<SignupUseCase>().call(
                    params: UserReq(
                      email: _emailController.text,
                      password: _passwordController.text,
                      fullName: _fullNameController.text,
                    ),
                  );
                  result.fold((l) =>
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l),
                      ),
                    ),
                    (r) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Do you have an account?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SigninScreen(),
                  ),
                );
              },
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
