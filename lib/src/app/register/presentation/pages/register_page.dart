import 'package:bek_task/src/app/login/presentation/widgets/login_form_widget.dart';
import 'package:bek_task/src/app/register/presentation/widgets/register_form_widget.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/image_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(

            children: [
              SizedBox(
                height: 250,
                child: SvgPicture.asset(ImageHelper.loginImg),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextWidget(
                text: StringHelper.createAccount,
                fontSize: 28,
                color: ColorHelper.primaryTextColor,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomTextWidget(
                  text: StringHelper.registerDetail,
                  fontSize: 14,
                  color: ColorHelper.txtFieldIconColor,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RegisterFormWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
