import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/feature/presentation/resources/routes_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/value_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/text_field_label.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _onNext() {
      Navigator.pushReplacementNamed(context, Routes.signupRoute);
    }

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
              children: const [
                TextFieldLabel(fieldName: "Email"),
                CustomTextFormField(hintText: "souemon16@gmail.com"),
                SizedBox(height: 20),
                TextFieldLabel(fieldName: "Password"),
                CustomTextFormField(hintText: "*******"),
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
            CustomElevatedButton(
              buttonChild: Text("LOGIN",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: ColorManager.white)),
              buttonStyle:
                  ElevatedButton.styleFrom(minimumSize: const Size(260, 60)),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
                buttonChild: Row(
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
                buttonStyle: ElevatedButton.styleFrom(
                    minimumSize: const Size(260, 60),
                    backgroundColor: ColorManager.primaryLight)),
            const SizedBox(height: 30),

            // ---------FOOTER TEXT----------
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "You don't have any account yet?",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " Signup",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: ColorManager.orangish,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _onNext();
                        })
                ])),
          ],
        ),
      ),
    );
  }
}
