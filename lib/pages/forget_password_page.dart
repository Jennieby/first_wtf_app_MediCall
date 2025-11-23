import 'dart:async';

import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_subtitle.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool showOtp = false;
  late String otpvalue;
  var emailController = TextEditingController();
  late Timer timer;
  int seconds = 10;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: showOtp
            ? _buildViewOtp()
            : Column(
                children: [
                  CustomTitle(title: "Forgot Password?"),
                  SizedBox(height: 5),
                  CustomSubtitle(
                    subtitle:
                        "Please enter your email, we will send you an OTP to reset your password!",
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    label: "Email",
                    textEditingController: emailController,
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    buttonText: "Get OTP",
                    onTap: () {
                      if (emailController.text.isNotEmpty) {
                        if (!emailController.text.contains("@") ||
                            !emailController.text.contains(".")) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blueAccent,
                              content: Text("Enter a valid Email Address!"),
                            ),
                          );
                          return;
                        }
                        setState(() {
                          showOtp = true;
                        });
                        timer = Timer.periodic(Duration(seconds: 1), (timer) {
                          if (seconds > 0) {
                            setState(() {
                              seconds--;
                            });
                          } else {
                            timer.cancel();
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blueAccent,
                            content: Text("Enter your Email Address!"),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildViewOtp() {
    return Column(
      spacing: 16,
      children: [
        CustomSubtitle(
          subtitle: "You've got mail! Enter the OTP you recieved!",
        ),
        OtpTextField(
          numberOfFields: 5,
          enabledBorderColor: Colors.grey.shade600,
          focusedBorderColor: Colors.blueAccent,
          showFieldAsBox: true,
          onCodeChanged: (value) {
            otpvalue = value;
          },
          onSubmit: (value) {
            otpvalue = value;
          },
        ),
        RichText(
          text: TextSpan(
            text: "Didn't get the code?",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "  Resend",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (seconds==0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("OTP Resent!"),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Wait time has not elapsed!"),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                    }
                    
                  },
              ),

              TextSpan(text: " in $seconds"),
            ],
          ),
        ),
        SizedBox(height: 40),
        CustomButton(
          buttonText: "Reset password",
          onTap: () {
            if (otpvalue.isNotEmpty) {
              if (otpvalue == "12345") {
                Navigator.of(context).pushReplacementNamed("/reset");
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
              }
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Enter OTP")));
            }
          },
        ),
      ],
    );
  }
}
