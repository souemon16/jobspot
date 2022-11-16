import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/feature/presentation/resources/assets_manager.dart';
import 'package:jobspot/feature/presentation/resources/color_manager.dart';

import '../../resources/value_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool? checkedValue = false;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 40),
                child: Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Email",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "souemon16@gmail.com",
                    fillColor: ColorManager.inputColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "******",
                    fillColor: ColorManager.inputColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: CheckboxListTile(
                    title: const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 10),
                    ),
                    value: checkedValue,
                    contentPadding: const EdgeInsets.all(0),
                    onChanged: (newValue) {},
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password ?",
                        style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline))),
              ],
            ),

            // -------------BUTTONS ---------------
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(260, 60)),
              child: Text("LOGIN",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: ColorManager.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(260, 60),
                  backgroundColor: ColorManager.primaryLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage(ImageAssets.googleLogo), width: 30),
                  Text(
                    " SIGN IN  WITH GOOGLE",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: ColorManager.primaryFont),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ---------FOOTER TEXT----------
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "You don't have any account yet?",
                      style: Theme.of(context).textTheme.bodyText1),
                  TextSpan(
                      text: " Signup",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: ColorManager.orangish,
                          decoration: TextDecoration.underline))
                ])),
          ],
        ),
      ),
    );
  }
}
