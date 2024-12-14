import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/storage_helper.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';

class LoginNotifier extends StateNotifier<AuthState> {
  LoginNotifier() : super(const AuthState());

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> login(String email, String password, BuildContext ctx) async {
    try {
      state = state.copyWith(isLoading: true);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.copyWith(user: userCredential.user, isLoading: false);
      print(userCredential.user);
      StorageUtil.putBool(StorageHelper.isLogin, userCredential.user != null ? true : false);
      ctx.go(AppRouteName.root);
      showToast('Login Successfully',
        context: ctx,
        animation: StyledToastAnimation.slideFromTopFade,
        backgroundColor: ColorHelper.buttonColor,
        textStyle: const TextStyle(
            color: ColorHelper.whiteColor
        ),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      showToast('Invalid Credential',
        context: ctx,
        animation: StyledToastAnimation.slideFromTopFade,
        backgroundColor: ColorHelper.buttonColor,
        textStyle: const TextStyle(
            color: ColorHelper.whiteColor
        ),
      );
    }
  }


}