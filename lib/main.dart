import 'dart:io';

import 'package:bek_task/src/app/welcome/presentation/welcome_page.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/constant/string_helper.dart';
import 'package:bek_task/src/routes/app_router.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBqV_8-7PX4xSa_uRzP2BZvj2hb5a260lQ',
        appId: '1:403728767121:android:9b67ba36fb046828bc8730',
        messagingSenderId: '403728767121',
        projectId: 'bek-test-demo',
      ),
    );
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  await StorageUtil.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: StringHelper.appName,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: ColorHelper.bgColor,
        ),
        routerConfig: AppRouter().router,
    );
  }
}

