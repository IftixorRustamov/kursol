import 'package:flutter/material.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: appRouter,
    );
  }
}
