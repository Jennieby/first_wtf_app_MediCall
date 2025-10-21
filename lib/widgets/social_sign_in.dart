
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              child: Image.asset(
                "assets/icons8-google-96.png",
                height: 20,
                width: 20,
              ),
            ),

            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons8-facebook-96.png",
                height: 20,
                width: 20,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons8-instagram-96.png",
                height: 20,
                width: 20,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons8-linkedin-96.png",
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
