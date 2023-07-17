import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_color.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  const EdgeInsets.fromLTRB(20, 30, 20, 5), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child:
                    Image.asset("assets/images/onboarding/branding_logo.png")),
            const SizedBox(height: 40),
            Image.asset('assets/images/onboarding/onboarding.png',),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColor.pureBlack, fontWeight: FontWeight.w600),
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
            const SizedBox(height: 20),
            Text(
              "Explore all the most exciting job roles based on your interest and study major.",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.bodyFontColor),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColor.pureWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
