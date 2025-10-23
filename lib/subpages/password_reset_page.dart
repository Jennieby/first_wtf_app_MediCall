import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_passwordtextfield.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPasswordField(
              label: "New Password",
              textEditingController: newPasswordController,
            ),
            CustomPasswordField(
              label: "Confirm New Password",
              textEditingController: confirmPasswordController,
            ),
            CustomButton(
              buttonText: "Reset Password",
              onTap: () {
                if (newPasswordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty) {
                  if (newPasswordController.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blueAccent,
                        content: Text(
                          "Password cannot be less than 6 characters",
                        ),
                      ),
                    );
                    return;
                  }
                  if (confirmPasswordController.text !=
                      newPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blueAccent,
                        content: Text("Passwords do not match"),
                      ),
                    );
                    return;
                  }

                  Navigator.of(context).pushReplacementNamed("/login");

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blueAccent,
                    content: Text("Input field(s) cannot be empty!"),
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
}
