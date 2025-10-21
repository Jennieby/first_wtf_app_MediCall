
import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_subtitle.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            CustomTitle(title: "Forgot Password?"),
            SizedBox(height: 5),
           CustomSubtitle(subtitle: "Please enter your email, we will send you a password rest link!"),
           SizedBox(height: 40),
            CustomTextField(label: "Email"),
            SizedBox(height: 40),
            CustomButton(buttonText: "Rest password"),
          ],
        ),
      ),
    );
  }
}