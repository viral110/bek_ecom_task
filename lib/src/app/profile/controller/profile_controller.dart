import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:bek_task/src/app/profile/controller/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final profileProvider = StateNotifierProvider<ProfileNotifier, AuthState>(
  (ref) => ProfileNotifier(),
);
