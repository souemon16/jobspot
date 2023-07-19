import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/core/constants/image_const.dart';
import 'package:jobspot/core/constants/route_const.dart';
import 'package:jobspot/features/user/presentation/cubit/credential/credential_cubit.dart';

import '../../../../config/themes/app_color.dart';
import '../widgets/user_custom_button.dart';

class CheckYourEmailPage extends StatefulWidget {
  const CheckYourEmailPage({super.key});

  @override
  State<CheckYourEmailPage> createState() => _CheckYourEmailPageState();
}

class _CheckYourEmailPageState extends State<CheckYourEmailPage> {
  @override
  Widget build(BuildContext context) {

    final dynamic arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    

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
                  "We have sent the reset password to the email address ${arguments['email']}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.bodyFontColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
              Image.asset(checkYourEmailImage, height: 130, fit: BoxFit.fitHeight,),

                // -------- Submit Buttons ------------------
                const SizedBox(height: 30),
                 UserCustomButton(
                    buttonInterface: const Text("CONTINUE"), buttonSize: const Size(260, 55), ontap: () { 
                      Navigator.pushNamedAndRemoveUntil(context, RouteConst.loginPage, (route) => false);
                     },),
                const SizedBox(height: 10),
                UserCustomButton(
                    buttonInterface: const Text("BACK TO LOGIN"),
                    buttonSize: const Size(260, 55),
                    backgroundColor: AppColor.secondaryColor,
                    fontcolor: AppColor.pureBlack, ontap: (){
                      Navigator.pushNamedAndRemoveUntil(context, RouteConst.loginPage, (route) => false);
                    },),


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
                        onPressed: () {
                          BlocProvider.of<CredentialCubit>(context).forgotPassword(arguments['email']);
                        },
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