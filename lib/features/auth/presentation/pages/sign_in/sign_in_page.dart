import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/common/widgets/app_bar/action_app_bar_wg.dart';
import 'package:kursol/core/common/widgets/default_button_wg.dart';
import 'package:kursol/core/common/widgets/textfield/custom_text_field_wg.dart';
import 'package:kursol/core/routes/route_paths.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/utils/utils_export.dart';
import '../../widgets/auth_checkbox_wg.dart';
import '../../widgets/auth_or_continue_with_wg.dart';
import '../../widgets/auth_sign_in_up_choice_wg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFocusedEmail = false;
  bool _isFocusedPassword = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isFocusedPassword = _passwordFocusNode.hasFocus;
        _isFocusedEmail = _emailFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      isFocused: _isFocusedEmail,
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      prefixIcon: IconlyBold.message,
                      hintText: AppStrings.email,
                      onTap: () {
                        setState(() {
                          _isFocusedEmail = true;
                        });
                      }),
                  CustomTextFieldWg(
                      isFocused: _isFocusedPassword,
                      obscureText: true,
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      prefixIcon: IconlyBold.lock,
                      hintText: AppStrings.password,
                      trailingWidget: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyBold.hide,
                          size: appH(20),
                          color: _isFocusedPassword
                              ? AppColors.primary()
                              : AppColors.greyScale.grey500,
                        ),
                      ),
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
                  DefaultButtonWg(
                      title: AppStrings.signIn,
                      onPressed: () {
                        context.go(RoutePaths.home);
                      }),
                  TextButton(
                      onPressed: () {
                        context.go(RoutePaths.forgotPassword);
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.urbanist.semiBold(
                            color: AppColors.primary.blue500, fontSize: 16),
                      )),
                ],
              ),
              AuthOrContinueWithWg(
                  onTapFacebook: () {}, onTapGoogle: () {}, onTapApple: () {}),
              AuthSignInUpChoiceWg(
                  text: AppStrings.dontHaveAccount,
                  onPressed: () {
                    context.go(RoutePaths.signup);
                  },
                  buttonText: AppStrings.signUp),
            ],
          ),
        ),
      ),
    );
  }
}
