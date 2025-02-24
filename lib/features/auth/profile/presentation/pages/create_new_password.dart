import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/auth/profile/presentation/widgets/show_succes_dialog.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/constants/strings/strings.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/default_button_wg.dart';
import '../../../../../core/routes/route_paths.dart';
import '../../../../../core/utils/textstyles/app_textstyles.dart';
import '../widgets/build_password_field.dart';

class CreateNewPassword extends StatefulWidget {
  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.go(RoutePaths.sendCodeForgotPassword);
        },
        titleText: AppStrings.createNewPassword,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 71),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/create_password.png",
                  width: appW(329),
                  height: appH(250),
                ),
              ),
              SizedBox(height: appH(71)),
              Text(
                'Create Your New Password',
                textAlign: TextAlign.center,
                style: AppTextStyles.urbanist.regular(
                    color: AppColors.greyScale.grey900, fontSize: 18),
              ),
              SizedBox(height: appH(24)),
              buildPasswordField(
                hintText: "New Password",
                obscureText: _obscurePassword,
                toggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              SizedBox(height: appH(24)),
              buildPasswordField(
                hintText: "Confirm Password",
                obscureText: _obscureConfirmPassword,
                toggleVisibility: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              SizedBox(height: appH(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: AppTextStyles.urbanist.regular(
                        color: AppColors.greyScale.grey900, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: appH(24)),
              DefaultButtonWg(title: AppStrings.profileContinue, onPressed: () {
                showSuccessDialog(context);
              })
            ],
          ),
        ),
      ),
    );
  }


}