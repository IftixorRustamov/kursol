import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:iconly/iconly.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button_wg.dart';
import 'package:kursol/core/common/widgets/textfield/custom_text_field_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:kursol/features/auth/presentation/providers/auth_provider.dart';
import 'package:kursol/core/common/constants/constants_export.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/utils/secure_storage.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../widgets/auth_checkbox_wg.dart';
import '../../widgets/auth_or_continue_with_wg.dart';
import '../../widgets/auth_sign_in_up_choice_wg.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  bool _isFocusedUsername = false;
  bool _isFocusedPassword = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(
      message,
      type: type,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  Future<void> _handleGoogleSignIn(WidgetRef ref) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception("Google ID Token topilmadi!");
      }

      final response = await Dio().get(
        "https://api.kursol.uz/v1/auth/grant-code",
        queryParameters: {"code": idToken},
      );

      if (response.data["success"] == true) {
        final accessToken = response.data["data"]["accessToken"];
        await SecureStorage.saveAccessToken(accessToken);
        context.go(RoutePaths.home);
      } else {
        throw Exception("Google Sign-in failed: ${response.data["error"]["message"]}");
      }
    } catch (e) {
      _showSnackBar(context, 'Google orqali tizimga kirish muvaffaqiyatsiz: $e', AnimatedSnackBarType.error);
    }
  }

  void _handleLogin(WidgetRef ref) async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showSnackBar(context, AppStrings.loginRequired, AnimatedSnackBarType.warning);
      return;
    }

    final authNotifier = ref.read(authNotifierProvider.notifier);
    try {
      await authNotifier.login(username, password);
      final authState = ref.read(authNotifierProvider);

      if (authState.value == true) {
        context.go(RoutePaths.home);
      }
    } catch (e) {
      _showSnackBar(context, '${AppStrings.failedLogin}', AnimatedSnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: ActionAppBarWg(onBackPressed: () {}),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: scaffoldPadding48,
          child: Column(
            spacing: appH(48),
            children: [
              Text(AppStrings.loginToYourAccount,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.urbanist
                      .bold(color: AppColors.greyScale.grey900, fontSize: 48)),
              Column(
                spacing: appH(24),
                children: [
                  CustomTextFieldWg(
                      isFocused: _isFocusedUsername,
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      prefixIcon: IconlyBold.message,
                      hintText: AppStrings.emailOrPhone,
                      onTap: () {
                        setState(() {
                          _isFocusedUsername = true;
                        });
                      }),
                  CustomTextFieldWg(
                      isFocused: _isFocusedPassword,
                      obscureText: true,
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      prefixIcon: IconlyBold.lock,
                      hintText: AppStrings.password,
                      onTap: () {
                        setState(() {
                          _isFocusedPassword = true;
                        });
                      }),
                  AuthCheckboxWg(
                      rememberMe: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      }),
                  authState.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => DefaultButtonWg(
                      title: AppStrings.signIn,
                      onPressed: () => _handleLogin(ref),
                    ),
                  ),
                  AuthOrContinueWithWg(
                    onTapFacebook: () {},
                    onTapGoogle: () => _handleGoogleSignIn(ref),
                    onTapApple: () {},
                  ),
                  AuthSignInUpChoiceWg(
                      text: AppStrings.dontHaveAccount,
                      onPressed: () {
                        context.go(RoutePaths.signup);
                      },
                      buttonText: AppStrings.signUp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
