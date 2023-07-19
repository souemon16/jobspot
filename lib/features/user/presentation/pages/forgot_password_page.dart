import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/core/constants/image_const.dart';
import 'package:jobspot/core/constants/route_const.dart';
import 'package:jobspot/features/user/presentation/cubit/credential/credential_cubit.dart';

import '../../../../config/themes/app_color.dart';
import '../widgets/user_custom_button.dart';
import '../widgets/user_custom_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget());
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
                "Forgot Password?",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.pureBlack),
              ),
              const SizedBox(height: 10),
              Text(
                "To reset your password, you need your email or mobile number that can be authenticated",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.bodyFontColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image.asset(
                forgotPasswordImage,
                height: 130,
                fit: BoxFit.fitHeight,
              ),
              UserCustomField(
                  fieldName: "Email",
                  hintText: "souemon16@gmail.com",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController),

              // -------- Submit Buttons ------------------
              const SizedBox(height: 30),
              UserCustomButton(
                buttonInterface: const Text("RESET PASSWORD"),
                buttonSize: const Size(260, 55),
                ontap: () {
                  forgotPasswordSubmit();
                },
              ),
              const SizedBox(height: 10),
              UserCustomButton(
                  buttonInterface: const Text("BACK TO LOGIN"),
                  buttonSize: const Size(260, 55),
                  backgroundColor: AppColor.secondaryColor,
                  fontcolor: AppColor.pureBlack,
                  ontap: () {
                    null;
                  }),
            ],
          ),
        ),
      ],
    );
  }

  void forgotPasswordSubmit() async {
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
    BlocProvider.of<CredentialCubit>(context)
        .forgotPassword(emailController.text);

    Navigator.pushReplacementNamed(context, RouteConst.checkYourEmailPage,
        arguments: {'email': emailController.text.trim()});
  }
}
