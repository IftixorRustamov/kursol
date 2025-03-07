import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/core/common/constants/constants_export.dart';
import 'package:kursol/core/common/widgets/widgets_export.dart';
import 'package:kursol/core/utils/utils_export.dart';
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

  void _handleSignUp() async {
    final notifier = ref.read(signUpProvider.notifier);
    await notifier.signUp(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      emailOrPhone: _emailOrPhoneController.text.trim(),
      password: _passwordController.text.trim(),
      useEmail: _useEmail,
    );

    final state = ref.read(signUpProvider);

    state.when(
      data: (_) {
        context.go(RoutePaths.home); // ✅ HomePage ga o'tish
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
    final signUpState = ref.watch(signUpProvider);

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
              Text(
                AppStrings.createYourAccount,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: AppTextStyles.urbanist.bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 48,
                ),
              ),
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
                  CustomTextFieldWg(
                    isFocused: _emailOrPhoneFocusNode.hasFocus,
                    controller: _emailOrPhoneController,
                    focusNode: _emailOrPhoneFocusNode,
                    prefixIcon: _useEmail ? IconlyBold.message : IconlyBold.call,
                    hintText: _useEmail ? AppStrings.email : AppStrings.phoneNumber,
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
                  CustomTextFieldWg(
                    isFocused: _passwordFocusNode.hasFocus,
                    obscureText: _obscureText,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    prefixIcon: IconlyBold.lock,
                    hintText: AppStrings.password,
                  ),
                  DefaultButtonWg(
                    title: signUpState is AsyncLoading ? "Signing Up..." : AppStrings.signUp,
                    onPressed: _handleSignUp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
