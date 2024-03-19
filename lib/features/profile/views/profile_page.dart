import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/features/authentication/auth_provider.dart';
import 'package:prime_template/features/authentication/views/login_page.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            UserCredential? userCredential = provider.userCredential;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await context
                          .read<AuthenticationProvider>()
                          .logout(context);
                    },
                    child: Container(
                      height: 36,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor1),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(color: primaryColor1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
