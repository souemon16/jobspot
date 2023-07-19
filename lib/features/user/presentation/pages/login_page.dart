import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/config/themes/app_color.dart';
import 'package:jobspot/core/constants/image_const.dart';
import 'package:jobspot/core/constants/route_const.dart';
import 'package:jobspot/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:jobspot/features/user/presentation/cubit/credential/credential_cubit.dart';
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
        body: BlocConsumer<CredentialCubit, CredentialState>(
            builder: (context, state) {
      if (state is CredentialLoading) {
        Center(child: CircularProgressIndicator(color: AppColor.primaryColor));
      }

      if (state is CredentialLoaded) {
        return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is Authenticated) {
            return const Placeholder();
          } else {
            return _bodyWidget();
          }
        });
      }
      return _bodyWidget();
    }, listener: (context, state) {
      if (state is CredentialLoaded) {
        BlocProvider.of<AuthCubit>(context).loggedIn();
      }
      if (state is CredentialFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: "An error Occured",
              message: "Pls Check Your Credentials",
              color: AppColor.primaryColor,
              contentType: ContentType.warning),
        ));
      }
    }));
  }

  Widget _bodyWidget() {
    return ListView(
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

              // -------- Form Fields ------------------
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
                  controller: passwordController),

              // -------- Checkboxes ------------------
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
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConst.forgotPasswordPage);
                      }, child: const Text("Forgot Password ?"))
                ],
              ),

              // -------- Submit Buttons ------------------

              const SizedBox(height: 30),
              UserCustomButton(
                buttonInterface: const Text("LOGIN"),
                buttonSize: const Size(260, 55),
                ontap: () {
                  loggedInUser();
                },
              ),
              const SizedBox(height: 10),
              UserCustomButton(
                buttonInterface: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      googleLogo,
                      width: 30,
                      fit: BoxFit.fitWidth,
                    ),
                    const Text("SIGN IN WITH GOOGLE")
                  ],
                ),
                buttonSize: const Size(260, 55),
                backgroundColor: AppColor.secondaryColor,
                fontcolor: AppColor.pureBlack,
                ontap: () {
                  BlocProvider.of<CredentialCubit>(context).googleAuth();
                },
              ),

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
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConst.signUp);
                      },
                      child: Text(
                        "Sign up",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColor.orangishColor,
                                decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  void loggedInUser() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: "Invalid Credentials",
            message: "Pls Enter Your Credentials",
            color: AppColor.primaryColor,
            contentType: ContentType.warning),
      ));
      return;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: "Invalid Credentials",
            message: "Pls Enter Your Credentials",
            color: AppColor.primaryColor,
            contentType: ContentType.warning),
      ));
      return;
    }

    BlocProvider.of<CredentialCubit>(context)
        .signIn(email: emailController.text, password: passwordController.text);
  }
}
