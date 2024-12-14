import 'package:bek_task/src/app/login/controller/login_provider.dart';
import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<LoginNotifier, AuthState>(
      (ref) => LoginNotifier(),
);