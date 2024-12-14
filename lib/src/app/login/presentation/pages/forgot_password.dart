import 'package:bek_task/src/app/login/presentation/widgets/login_form_widget.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/image_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_button_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_form_field_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: SvgPicture.asset(ImageHelper.loginImg),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextWidget(
                text: StringHelper.forgotPassword,
                fontSize: 28,
                color: ColorHelper.primaryTextColor,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(height: 6),
              const CustomTextWidget(
                text: "* We will send you a mail to set or reset your new password",
                fontSize: 14,
                color: ColorHelper.txtFieldIconColor,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10,
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

              // Forgot Password
              const SizedBox(height: 20),
              CustomButtonWidget(
                name: "Submit",
                onTap: () async {
                  if (emailController.text.isNotEmpty) {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: 'viralvegad2001@gmail.com');
                    context.pop();
                    showToast(
                      "Mail sent successfully",
                      context: context,
                      backgroundColor: ColorHelper.buttonColor,
                      textStyle: const TextStyle(color: ColorHelper.whiteColor),
                    );
                  } else {
                    showToast(
                      "Please enter email",
                      context: context,
                      backgroundColor: ColorHelper.buttonColor,
                      textStyle: const TextStyle(color: ColorHelper.whiteColor),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
