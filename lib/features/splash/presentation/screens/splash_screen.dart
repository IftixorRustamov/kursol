import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    widgetsBinding.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        // ignore: use_build_context_synchronously
        context.go('/onboarding');
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/icons/splash1.svg'),
            SvgPicture.asset('assets/icons/splash2.svg'),
          ],
        ),
      ),
    );
  }
}
