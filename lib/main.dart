import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes.dart';
import 'package:getx_mvvm/view/splahs_screen.dart';

import 'res/getx_loclization/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        // primarySwatch: Colors.amber,
        // // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SpalshScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
