import 'package:bek_task/src/app/profile/controller/profile_controller.dart';
import 'package:bek_task/src/app/profile/presentation/widgets/profile_data_widget.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/common/widgets/custom_app_bar_widget.dart';
import 'package:bek_task/src/common/widgets/custom_button_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_form_field_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Profile',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: "Email:"),
              const SizedBox(height: 20),
              ProfileDataWidget(),
              const SizedBox(height: 20),

            ],
          ),
        ));
  }
}
