import 'package:bek_task/src/app/login/model/login_model.dart';
import 'package:bek_task/src/app/register/controller/register_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<RegisterNotifier, AuthState>(
      (ref) => RegisterNotifier(),
);