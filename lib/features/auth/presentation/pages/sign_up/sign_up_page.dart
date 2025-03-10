import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/routes/route_paths.dart';
import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../../core/utils/textstyles/app_textstyles.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/auth_checkbox_wg.dart';
import '../../widgets/auth_or_continue_with_wg.dart';
import '../../widgets/auth_sign_in_up_choice_wg.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailOrPhoneFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _obscureText = true;
  bool _useEmail = true;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailOrPhoneFocusNode.dispose();
    _emailOrPhoneController.dispose();
    _lastNameFocusNode.dispose();
    _lastNameController.dispose();
    _firstNameFocusNode.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  void _toggleInputMode() {
    setState(() {
      _useEmail = !_useEmail;
      _emailOrPhoneController.clear();
    });
  }

  Future<void> _registerUser() async {
    final registerNotifier = ref.read(registerProvider.notifier);

    final success = await registerNotifier.register(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      emailOrPhone: _emailOrPhoneController.text,
      password: _passwordController.text,
      useEmail: _useEmail,
    );

    if (success) {
      context.go(RoutePaths.otpVerification, extra: {
        "identifier": _emailOrPhoneController.text,
        "isSignUp": true,
      });
    } else {
      final errorMessage = ref.read(registerProvider).when(
        data: (_) => null,
        loading: () => null,
        error: (error, _) => error.toString(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage ?? "Registration failed. Try again.")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);

    return Scaffold(
      appBar: ActionAppBarWg(onBackPressed: () {
        context.go(RoutePaths.auth);
      }),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: scaffoldPadding24,
          child: Column(
            spacing: appH(20),
            children: [
              Text(AppStrings.createYourAccount,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.urbanist
                      .bold(color: AppColors.greyScale.grey900, fontSize: 48)),
              Column(
                spacing: appH(16),
                children: [
                  CustomTextFieldWg(
                    isFocused: _firstNameFocusNode.hasFocus,
                    controller: _firstNameController,
                    focusNode: _firstNameFocusNode,
                    prefixIcon: IconlyBold.profile,
                    hintText: AppStrings.firstName,
                  ),
                  CustomTextFieldWg(
                    isFocused: _lastNameFocusNode.hasFocus,
                    controller: _lastNameController,
                    focusNode: _lastNameFocusNode,
                    prefixIcon: IconlyBold.profile,
                    hintText: AppStrings.lastName,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: appH(10),
                    children: [
                      CustomTextFieldWg(
                        isFocused: _emailOrPhoneFocusNode.hasFocus,
                        controller: _emailOrPhoneController,
                        focusNode: _emailOrPhoneFocusNode,
                        prefixIcon:
                        _useEmail ? IconlyBold.message : IconlyBold.call,
                        hintText: _useEmail
                            ? AppStrings.email
                            : AppStrings.phoneNumber,
                      ),
                      GestureDetector(
                        onTap: _toggleInputMode,
                        child: Text(
                          _useEmail ? 'Use phone instead' : 'Use email instead',
                          style: AppTextStyles.urbanist.semiBold(
                            color: AppColors.primary(),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFieldWg(
                    isFocused: _passwordFocusNode.hasFocus,
                    obscureText: _obscureText,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    prefixIcon: IconlyBold.lock,
                    hintText: AppStrings.password,
                    trailingWidget: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? IconlyBold.hide : IconlyBold.show,
                        size: appH(20),
                        color: _passwordFocusNode.hasFocus
                            ? AppColors.primary()
                            : AppColors.greyScale.grey500,
                      ),
                    ),
                  ),
                  AuthCheckboxWg(
                      rememberMe: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      }),
                  registerState.when(
                    data: (isRegistered) => DefaultButtonWg(
                      title: AppStrings.signUp,
                      onPressed: _registerUser,
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Column(
                      children: [
                        Text(error.toString(), style: TextStyle(color: Colors.red)),
                        DefaultButtonWg(
                          title: AppStrings.signUp,
                          onPressed: _registerUser,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AuthOrContinueWithWg(
                  onTapFacebook: () {}, onTapGoogle: () {}, onTapApple: () {}),
              AuthSignInUpChoiceWg(
                  text: AppStrings.alreadyHaveAccount,
                  onPressed: () {
                    context.go(RoutePaths.signin);
                  },
                  buttonText: AppStrings.signIn),
            ],
          ),
        ),
      ),
    );
  }
}
