import 'package:flutter/material.dart';

import '../../../../config/themes/app_color.dart';
import '../widgets/user_custom_button.dart';

class CheckYourEmailPage extends StatelessWidget {
  const CheckYourEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Check Your Email",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColor.pureBlack),
                ),
                const SizedBox(height: 10),
                Text(
                  "We have sent the reset password to the email address brandonelouis@gmial.com",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.bodyFontColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
              Image.asset("assets/images/onboarding/check_your_email.png", height: 130, fit: BoxFit.fitHeight,),

                // -------- Submit Buttons ------------------
                const SizedBox(height: 30),
                const UserCustomButton(
                    buttonInterface: Text("CONTINUE"), buttonSize: Size(260, 55)),
                const SizedBox(height: 10),
                UserCustomButton(
                    buttonInterface: const Text("BACK TO LOGIN"),
                    buttonSize: const Size(260, 55),
                    backgroundColor: AppColor.secondaryColor,
                    fontcolor: AppColor.pureBlack),


                    // -----Resend Link to Email------------
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You haven't received the email?",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColor.bodyFontColor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColor.orangishColor,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}