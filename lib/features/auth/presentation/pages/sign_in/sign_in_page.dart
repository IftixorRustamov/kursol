import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button_wg.dart';
import 'package:kursol/core/common/widgets/textfield/custom_text_field_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/common/constants/constants_export.dart';
import 'package:kursol/core/utils/utils_export.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/auth_checkbox_wg.dart';
import '../../widgets/auth_or_continue_with_wg.dart';
import '../../widgets/auth_sign_in_up_choice_wg.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFocusedEmail = false;
  bool _isFocusedPassword = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    final notifier = ref.read(signInProvider.notifier);
    await notifier.signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final state = ref.read(signInProvider);

    state.when(
      data: (_) {
        context.go(RoutePaths.home);
      },
      error: (message, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.toString())),
        );
      },
      loading: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInProvider);

    return Scaffold(
      appBar: ActionAppBarWg(onBackPressed: () {}),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: scaffoldPadding48,
          child: Column(
            spacing: appH(48),
            children: [
              Text(
                AppStrings.loginToYourAccount,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 48,
                ),
              ),
              Column(
                spacing: appH(24),
                children: [
                  CustomTextFieldWg(
                    isFocused: _isFocusedEmail,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    prefixIcon: IconlyBold.message,
                    hintText: AppStrings.email,
                    onTap: () {
                      setState(() {
                        _isFocusedEmail = true;
                      });
                    },
                  ),
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
                    },
                  ),
                  AuthCheckboxWg(
                    rememberMe: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  DefaultButtonWg(
                    title: signInState is AsyncLoading ? "Signing In..." : AppStrings.signIn,
                    onPressed: _handleSignIn,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(RoutePaths.forgotPassword);
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppTextStyles.urbanist.semiBold(
                        color: AppColors.primary.blue500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              AuthOrContinueWithWg(
                onTapFacebook: () {},
                onTapGoogle: () {},
                onTapApple: () {},
              ),
              AuthSignInUpChoiceWg(
                text: AppStrings.dontHaveAccount,
                onPressed: () {
                  context.go(RoutePaths.signup);
                },
                buttonText: AppStrings.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
