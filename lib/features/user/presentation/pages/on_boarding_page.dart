import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_color.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/onboarding/branding_logo.png"),
            Image.asset('assets/images/onboarding/onboarding.png'),
            
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.pureBlack),
                  children: [
                    const TextSpan(text: "Find Your\n"),
                    TextSpan(
                        text: "Dream Job\n",
                        style: TextStyle(
                            color: AppColor.orangishColor,
                            decoration: TextDecoration.underline)),
                    const TextSpan(text: "Here!"),
                  ]),
            ),
            Text(
              "Explore all the most exciting job roles based on your interest and study major.",
              style: Theme.of(context).textTheme.labelMedium,
            ),

          ],
        ),
      ),
    );
  }
}
