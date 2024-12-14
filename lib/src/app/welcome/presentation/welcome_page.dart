import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/image_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_button_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    ImageHelper.welcome2Img,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const CustomTextWidget(
                      text: StringHelper.welcomeIntroTitle,
                      fontSize: 32,
                      color: ColorHelper.whiteColor,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextWidget(
                      text: StringHelper.welcomeIntroSubTitle,
                      fontSize: 14,
                      color: ColorHelper.whiteColor,
                      align: TextAlign.center,
                    ),
                    CustomButtonWidget(
                      name: StringHelper.getStarted,
                      onTap: () {
                        context.push(AppRouteName.login);
                      },
                      margin: const EdgeInsets.only(left: 30, right: 30, top: 25),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
