import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:provider/provider.dart';

import '../auth_provider.dart';
import '../components/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Consumer<AuthenticationProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SvgPicture.asset('assets/icons/logo.svg'),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome to Dentsu LMS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: const [
                          TextSpan(
                            text: "Username",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldCustom(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.all(14),
                      child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        color: primaryColor,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter email" : null,
                    hintText: 'Enter your email or username',
                    controller: provider.usernameController,
                    onChanged: (emailAddress) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: const [
                          TextSpan(
                            text: "Username",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldCustom(
                    obscureText: true,
                    obscuringCharacter: '*',
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.all(14),
                      child: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        color: primaryColor,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter email" : null,
                    hintText: 'Enter your password',
                    controller: provider.passwordController,
                    onChanged: (pass) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: provider.keepMeLoggedIn,
                        onChanged: (bool? val) {
                          context
                              .read<AuthenticationProvider>()
                              .toggleKeepMeLoggedIn(val);
                        },
                        splashRadius: 30,
                        side: BorderSide(color: Colors.white),
                      ),
                      Text(
                        'Keep me logged in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthenticationProvider>().logInUser(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
