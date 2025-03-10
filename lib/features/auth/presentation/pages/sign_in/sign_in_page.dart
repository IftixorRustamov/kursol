import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:iconly/iconly.dart';

import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button_wg.dart';
import 'package:kursol/core/common/widgets/textfield/custom_text_field_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/utils/logger/app_logger.dart';
import 'package:kursol/core/utils/textstyles/app_textstyles.dart';
import 'package:kursol/features/auth/presentation/providers/auth_provider.dart';
import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../../core/utils/secure_storage.dart';
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
  String? _errorMessage;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  /// **Google orqali tizimga kirish (Firebase ishlatmasdan)**
  Future<void> _handleGoogleSignIn(WidgetRef ref) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return; // Foydalanuvchi tizimga kirishni bekor qildi
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception("Google ID Token topilmadi!");
      }

      // 🔗 Google ID Token ni backend API ga yuborish
      final response = await Dio().get(
        "https://api.kursol.uz/v1/auth/grant-code",
        queryParameters: {"code": idToken},
      );

      logger.i("✅ Serverdan javob: ${response.data}");

      if (response.data["success"] == true) {
        final accessToken = response.data["data"]["accessToken"];

        // 🔐 Tokenni saqlash
        await SecureStorage.saveAccessToken(accessToken);

        // 🔀 Tizimga kirgandan keyin bosh sahifaga yo‘naltirish
        context.go(RoutePaths.home);
      } else {
        throw Exception("Google Sign-in failed: ${response.data["error"]["message"]}");
      }
    } catch (e) {
      logger.e("🔥 Google Sign-in xatosi: $e");
      setState(() {
        _errorMessage = "Google orqali tizimga kirish muvaffaqiyatsiz: $e";
      });
    }
  }

  void _handleLogin(WidgetRef ref) async {
    setState(() { _errorMessage = null; });

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() { _errorMessage = "Username va Parol talab qilinadi"; });
      return;
    }

    final authNotifier = ref.read(authNotifierProvider.notifier);

    try {
      await authNotifier.login(username, password);
      final authState = ref.read(authNotifierProvider);

      if (authState.value == true) {
        context.go(RoutePaths.home);
      }
    } on Exception catch (e) {
      logger.e("🔥 Login xatosi: $e");

      setState(() {
        _errorMessage = "Login muvaffaqiyatsiz: ${e.toString()}";
      });
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
                      hintText: "Username",
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

                  if (_errorMessage != null) ...[
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],

                  authState.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => DefaultButtonWg(
                      title: AppStrings.signIn,
                      onPressed: () => _handleLogin(ref),
                    ),
                  ),

                  AuthOrContinueWithWg(
                    onTapFacebook: () {},
                    onTapGoogle: () => _handleGoogleSignIn(ref), // ✅ Google Sign-in
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
