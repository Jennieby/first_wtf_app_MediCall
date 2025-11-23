import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_wtf_app/bottom_navigation.dart';
import 'package:first_wtf_app/firebase_options.dart';
import 'package:first_wtf_app/pages/forget_password_page.dart';
import 'package:first_wtf_app/pages/login_page.dart';
import 'package:first_wtf_app/pages/signup_page.dart';
import 'package:first_wtf_app/pages/onboarding_page.dart';
import 'package:first_wtf_app/provider/hospital_notifier.dart';
import 'package:first_wtf_app/provider/user_notifier.dart';
import 'package:first_wtf_app/subpages/password_reset_page.dart';
import 'package:first_wtf_app/subpages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoogleSignIn.instance.initialize(
    clientId: Platform.isAndroid
        ? "1001899634835-t9s1bu7uk0s41ci8q3d4deent8qatfga.apps.googleusercontent.com"
        : "1001899634835-o19lj2ds4stljcp4jnd1omdjf70aoe9a.apps.googleusercontent.com",
    serverClientId:
        "1001899634835-1bsqj6jqo79pvhc5q9ggv6nvm47dhhth.apps.googleusercontent.com",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HospitalNotifier(),
      child: ChangeNotifierProvider(
        create: (context) => UserNotifier(),
        child: MaterialApp(
          title: 'MediCall',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            "/o": (context) => OnboardingPage(),
            "/home": (context) => BottomNavigation(),
            "/signup": (context) => SignupPage(),
            "/login": (context) => LoginPage(),
            "/search": (context) => SearchPage(),
            "/password_reset": (context) => ForgetPasswordPage(),
            "/reset": (context) => PasswordResetPage(),
          },
          initialRoute: "/o",
        ),
      ),
    );
  }
}
