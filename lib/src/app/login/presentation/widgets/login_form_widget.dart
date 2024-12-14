import 'dart:ui';

import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_button_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_form_field_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';

import '../../controller/login_controller.dart';

class LoginFormWidget extends ConsumerWidget {
  LoginFormWidget({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (authState.isLoading) Center(child: const CircularProgressIndicator()),

            // Email
            const SizedBox(height: 20),
            CustomTextFormField(
              readOnly: false,
              height: 50,
              width: width,
              hintText: StringHelper.email,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.person,
                color: ColorHelper.txtFieldIconColor,
                size: 20,
              ),
              onChange: (val) {},
              textController: emailController,
            ),

            // Password
            const SizedBox(height: 20),
            CustomTextFormField(
              readOnly: false,
              height: 50,
              width: width,
              hintText: StringHelper.password,
              keyboardType: TextInputType.text,
              obscureText: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: ColorHelper.txtFieldIconColor,
                size: 20,
              ),
              onChange: (val) {},
              textController: passwordController,
            ),

            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () async {
                  context.push(AppRouteName.forgotPasswordPage);
                },
                child: const CustomTextWidget(
                  text: StringHelper.forgotPassword,
                  color: ColorHelper.primaryTextColor,
                  fontSize: 16,
                ),
              ),
            ),

            CustomButtonWidget(
              name: StringHelper.login,
              onTap: () async {
                if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  await authNotifier.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context
                  );
                } else {
                  showToast(
                    "Please enter details",
                    context: context,
                    backgroundColor: ColorHelper.buttonColor,
                    textStyle: const TextStyle(color: ColorHelper.whiteColor),
                  );
                }
              },
              margin: const EdgeInsets.only(left: 0, right: 0, top: 25),
            ),

            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(text: StringHelper.createNewAccount),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    context.push(AppRouteName.register);
                  },
                  child: const CustomTextWidget(
                    text: StringHelper.signUp,
                    color: ColorHelper.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
