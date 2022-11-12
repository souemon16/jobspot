import 'package:flutter/material.dart';

import 'package:jobspot/presentation/resources/assets_manager.dart';
import 'package:jobspot/presentation/resources/color_manager.dart';
import 'package:jobspot/presentation/resources/strings_manager.dart';
import 'package:jobspot/presentation/resources/textstyle_manager.dart';
import 'package:jobspot/presentation/resources/value_manager.dart';

import '../resources/routes_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.right,
              AppString.logoName,
              style: getHeading3Style(color: ColorManager.primaryFont),
            ),
          ),

          // Onboarding Image
          const Image(image: AssetImage(ImageAssets.onboardingImage)),

          // Onboarding Title
          RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: [
                TextSpan(
                    text: AppString.onboardingTitle,
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(
                    text: AppString.onboardingTitleRichText,
                    style: getHeading1Style(color: ColorManager.orangish)
                        .copyWith(decoration: TextDecoration.underline)),
                TextSpan(
                    text: AppString.onboardingTitleTrail,
                    style: Theme.of(context).textTheme.headline1)
              ])),

          // Onboarding Subtitle
          SizedBox(
            width: 300,
            child: Text(
              AppString.onboardingSubtitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          // Onboarding Button
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  minimumSize: const Size(60, 60)),
              child: const Icon(Icons.arrow_forward_outlined),
            ),
          )
        ],
      ),
    ));
  }
}
