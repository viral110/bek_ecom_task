import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';

class RegisterNotifier extends StateNotifier<AuthState> {
  RegisterNotifier() : super(const AuthState());

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> register(String email, String password, BuildContext ctx) async {
    try {
      state = state.copyWith(isLoading: true);
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.copyWith(user: userCredential.user, isLoading: false);
      showToast('Account Created Successfully',
        context: ctx,
        animation: StyledToastAnimation.slideFromBottomFade,
        backgroundColor: ColorHelper.buttonColor,
        textStyle: const TextStyle(
          color: ColorHelper.whiteColor
        ),
      );
      ctx.pop();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }


}