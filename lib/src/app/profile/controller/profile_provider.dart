import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_name.dart';

class ProfileNotifier extends StateNotifier<AuthState> {
  ProfileNotifier() : super(const AuthState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout(BuildContext ctx) async {
    StorageUtil.clearData();
    await _auth.signOut();


    ctx.go(AppRouteName.root);
    
    state = const AuthState();
    //
    // ctx.go(AppRouteName.root);
  }

}