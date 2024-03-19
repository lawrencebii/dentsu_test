import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/features/authentication/views/login_page.dart';
import 'package:prime_template/features/navigation/views/navigation.dart';
import 'package:prime_template/state_management_class.dart';
import 'package:prime_template/utils/colors.dart';

import 'utils/petite_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyDwZwfH1Q0vXU_-Vy8ngib7_EtCAlktdlM", // paste your api key here
      appId:
          "1:533965491780:android:19124aa8284cc9955d7611", //paste your app id here
      messagingSenderId: "533965491780", //paste your messagingSenderId here
      projectId: "fluttertest-17567", //paste your project id here
    ),
  );
  // LocalNotificationService.initialize();
  await StorageUtil.getInstance();
  StorageUtil.putString(key: 'permission', value: '0');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn() {
      final user = FirebaseAuth.instance.currentUser;
      return user != null;
    }

    return StateManagementClass(
      child: MaterialApp(
          title: 'Dentsu Test',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'DM Sans',
            appBarTheme: AppBarTheme(
              backgroundColor: primaryColor,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
          home: isUserLoggedIn() ? Navigation() : const LoginScreen()),
    );
  }
}
