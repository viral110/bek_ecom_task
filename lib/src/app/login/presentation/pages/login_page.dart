import 'package:bek_task/src/app/login/presentation/widgets/login_form_widget.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/image_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                text: StringHelper.loginHere,
                fontSize: 28,
                color: ColorHelper.primaryTextColor,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(height: 6),
              const CustomTextWidget(
                text: StringHelper.loginDetail,
                fontSize: 14,
                color: ColorHelper.txtFieldIconColor,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginFormWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
