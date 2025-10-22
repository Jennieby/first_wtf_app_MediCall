import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_passwordtextfield.dart';
import 'package:first_wtf_app/widgets/custom_subtitle.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/custom_title.dart';
import 'package:first_wtf_app/widgets/social_sign_in.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool agreeToProcessData = false;
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 140),

        children: [
          CustomTitle(title: "Get Started"),
          SizedBox(height: 5),
          CustomSubtitle(subtitle: "Register below with your details!"),
          SizedBox(height: 40),
          CustomTextField(
            label: "Full Name",
            textEditingController: fullNameController,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Email",
            textEditingController: emailController,
          ),
          SizedBox(height: 20),
          CustomPasswordField(
            label: "Password",
            textEditingController: passwordController,
          ),
          SizedBox(height: 20),
          CustomPasswordField(
            label: "Confirm Password",
            textEditingController: confirmPasswordController,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Checkbox(
                value: agreeToProcessData,
                activeColor: Colors.blueAccent,
                onChanged: (value) {
                  setState(() {
                    agreeToProcessData = value!;
                  });
                },
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I agree to the processing of",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Personal data",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 35),
          CustomButton(
            buttonText: "Sign up",
            onTap: () {
              // if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(fullNameController.text)) {
              //   ScaffoldMessenger.of(
              //     context,
              //   ).showSnackBar(SnackBar(content: Text("bshv")));
              //   return;
              // }
              if (!emailController.text.contains("@")) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Invalid Email")));

                return;
              }

              if(passwordController.text.length<6){
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Password should not be less than 6 characters")));

                return;
              }

              if(confirmPasswordController.text!=passwordController.text){
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Passwords do not match")));

                return;
              }

              Navigator.of(context).pushReplacementNamed("/home");
            },
          ),
          SizedBox(height: 30),

          SocialSignIn(label: "Sign up with"),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("/login");
                },
                child: Text(
                  " Sign in",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
