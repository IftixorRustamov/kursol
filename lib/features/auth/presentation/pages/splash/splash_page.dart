import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/config/gen/assets.gen.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    widgetsBinding.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/onboarding');
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: appH(100)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SvgPicture.asset(Assets.icons.splash1)),
              SvgPicture.asset(Assets.icons.splash2),
            ],
          ),
        ),
      ),
    );
  }
}
