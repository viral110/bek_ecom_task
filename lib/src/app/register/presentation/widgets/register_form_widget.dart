import 'dart:ui';

import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_button_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_form_field_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';

import '../../controller/register_controller.dart';

class RegisterFormWidget extends ConsumerWidget {
  RegisterFormWidget({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (authState.isLoading) const CircularProgressIndicator(),
          if (authState.errorMessage != null)
            Text(
              authState.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),

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

          // Confirm Password
          const SizedBox(height: 20),
          CustomTextFormField(
            readOnly: false,
            height: 50,
            width: width,
            hintText: StringHelper.confirmPassword,
            keyboardType: TextInputType.text,
            obscureText: true,
            prefixIcon: const Icon(
              Icons.lock,
              color: ColorHelper.txtFieldIconColor,
              size: 20,
            ),
            onChange: (val) {},
            textController: confirmPasswordController,
          ),



          CustomButtonWidget(
            name: StringHelper.createAccount,
            onTap: () async {
              if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
                if(passwordController.text.trim() == confirmPasswordController.text.trim()){
                  await authNotifier.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context
                  );
                } else {
                  showToast(
                    "Password not match",
                    context: context,
                    backgroundColor: ColorHelper.buttonColor,
                    textStyle: const TextStyle(color: ColorHelper.whiteColor),
                  );
                }
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
              const CustomTextWidget(text: StringHelper.alreadyHaveAccount),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  context.pop();
                },
                child: const CustomTextWidget(
                  text: StringHelper.login,
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
    );
  }
}
