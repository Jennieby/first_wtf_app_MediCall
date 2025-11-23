import 'package:first_wtf_app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    var googleUserProvider = Provider.of<UserNotifier>(context);
    return Column(
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(child: Divider()),
            Text(label, style: TextStyle(fontWeight: FontWeight.w300)),
            Expanded(child: Divider()),
          ],
        ),

        SizedBox(height: 10),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                googleUserProvider.signInWithGoogle(context);
              },
              child: Image.asset(
                "assets/icons/icons8-google-96.png",
                height: 30,
                width: 30,
              ),
            ),

            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/icons8-facebook-96.png",
                height: 30,
                width: 30,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/icons8-instagram-96.png",
                height: 30,
                width: 30,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/icons8-linkedin-96.png",
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
