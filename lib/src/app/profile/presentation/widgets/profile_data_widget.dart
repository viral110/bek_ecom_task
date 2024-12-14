import 'package:bek_task/src/app/profile/controller/profile_controller.dart';
import 'package:bek_task/src/common/widgets/custom_text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final displayNameController = TextEditingController(text: user!.email ?? "");

    return CustomTextFormField(
      textController: displayNameController,
    );
  }
}