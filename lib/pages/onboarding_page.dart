import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activeIndex = 0;

  List<OnboardingItem> items = [
    OnboardingItem(
      displayImage: "assets/onboardingscr.png",
      title: "Welcome to MediCall",
      subTitle:
          "Quickly find and request ambulances from nearby hospitals during emergencies.",
    ),
    OnboardingItem(
      displayImage: "assets/onboardingscr.png",
      title: "Get emergency medical help fast ",
      subTitle:
          "Need urgent help? We'll connect you to the nearest available ambulance.",
    ),
    OnboardingItem(
      displayImage: "assets/onboardingscr.png",
      title: "Meet world class first responders",
      subTitle: "Wherever you are, we get you to the very best care.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var onboardingItemToShow = items[activeIndex];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                
                Navigator.of(context).pushReplacementNamed("/signup");
                
              },
              child: Text(
                "Skip>",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          SizedBox(height: 40),
          CustomIndicator(
            indicatorCount: items.length,
            activeIndex: activeIndex,
          ),
          Image.asset(
            onboardingItemToShow.displayImage,
            height: 300,
            width: 300,
          ),

          Text(
            onboardingItemToShow.title,
            style: GoogleFonts.aDLaMDisplay(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            onboardingItemToShow.subTitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeIndex <= 0
                ? SizedBox(height: 0)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = activeIndex - 1;
                      });
                    },
                    child: Text("Back"),
                  ),
            ElevatedButton(
              onPressed: () {
                if (activeIndex < items.length - 1) {
                  setState(() {
                    activeIndex = activeIndex + 1;
                  });
                } else {
                  Navigator.of(context).pushReplacementNamed("/signup");
                }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.indicatorCount,
    required this.activeIndex,
  });
  final int indicatorCount;
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: List.generate(
        indicatorCount,
        (index) => Container(
          height: 8,
          width: 10,
          decoration: BoxDecoration(
            color: activeIndex == index
                ? Colors.blueAccent.shade400
                : Colors.blueAccent.shade100,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  String title;
  String subTitle;
  String displayImage;

  OnboardingItem({
    required this.displayImage,
    required this.title,
    required this.subTitle,
  });
}
