import 'package:first_wtf_app/bottom_navigation.dart';
import 'package:first_wtf_app/pages/forget_password_page.dart';
import 'package:first_wtf_app/pages/login_page.dart';
import 'package:first_wtf_app/pages/signup_page.dart';

import 'package:first_wtf_app/pages/onboarding_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viberly',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=> OnboardingPage(),
        "/home":(context)=>BottomNavigation(),
        "/signup":(context)=>SignupPage(),
        "/login":(context)=>LoginPage(),
        "/password_reset":(context)=>ForgetPasswordPage()
      },
      initialRoute: "/signup",
      
    );
  }
}

