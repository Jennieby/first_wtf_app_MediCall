import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_passwordtextfield.dart';
import 'package:first_wtf_app/widgets/custom_subtitle.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/custom_title.dart';
import 'package:first_wtf_app/widgets/social_sign_in.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 140),
        children: [
          CustomTitle(title: "Welcome Back"),
          SizedBox(height: 5),
          CustomSubtitle(
            subtitle: "It's been a while! Log in below with your details.",
          ),
          SizedBox(height: 40),
          CustomTextField(
            label: "Email",
            textEditingController: emailController,
          ),
          SizedBox(height: 20),
          CustomPasswordField(
            label: "Password",
            textEditingController: passwordController,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: Colors.blueAccent,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value!;
                  });
                },
              ),

              Text(
                "Remember me",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/password_reset");
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          CustomButton(
            buttonText: "Log in",
            onTap: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                if (!emailController.text.contains("@") ||
                    !emailController.text.contains(".")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Email Address Not Found!")),
                  );
                  return;
                }
                if (passwordController.text.length < 6) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Incorrect Password")));
                  return;
                }
                if (rememberMe == false) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Sign in details not saved!"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed("/home");
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
                Navigator.of(context).pushReplacementNamed("/home");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Email or Password fields cannot be empty!"),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 30),
          SocialSignIn(label: "Sign in with"),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              GestureDetector(
                onTap: () {
                  
                    Navigator.of(context).pushReplacementNamed("/signup");
                 
                },
                child: Text(
                  " Sign up",
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
