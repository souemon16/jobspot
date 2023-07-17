import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_color.dart';
import 'package:jobspot/features/user/presentation/widgets/user_custom_button.dart';
import 'package:jobspot/features/user/presentation/widgets/user_custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkoxValue = false;
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  "Welcome Back",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColor.pureBlack),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.bodyFontColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                UserCustomField(
                    fieldName: "Email",
                    hintText: "souemon16@gmail.com",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController),
                const SizedBox(height: 20),
                UserCustomField(
                    fieldName: "Password",
                    hintText: "*******",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: emailController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: checkoxValue,
                          activeColor: AppColor.checkboxColor,
                          checkColor: AppColor.pureBlack,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return AppColor.checkboxColor;
                            }
                            return Colors.purple.shade200;
                          }),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onChanged: (newValue) {
                            setState(() {
                              checkoxValue = newValue!;
                            });
                          },
                        ),
                        const Text("Remember Me")
                      ],
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text("Forgot Password ?"))
                  ],
                ),


                // -------- Submit Buttons ------------------ 

                const SizedBox(height: 30),
                const UserCustomButton(
                    buttonInterface: Text("LOGIN"), buttonSize: Size(260, 55)),
                const SizedBox(height: 10),
                UserCustomButton(
                    buttonInterface: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/onboarding/google_logo.png",
                          width: 30,
                          fit: BoxFit.fitWidth,
                        ),
                        const Text("SIGN IN WITH GOOGLE")
                      ],
                    ),
                    buttonSize: const Size(260, 55),
                    backgroundColor: AppColor.secondaryColor,
                    fontcolor: AppColor.pureBlack),
            
                // -----Sign Up Instead------------
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have an account yet?",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColor.bodyFontColor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign up",
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
