import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/routes/route_paths.dart';
import 'package:kursol/features/auth/presentation/providers/auth_provider.dart';
import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../../core/utils/utils_export.dart';

class OtpVerificationPage extends ConsumerStatefulWidget {
  final String identifier;
  final bool isSignUp;

  const OtpVerificationPage({
    super.key,
    required this.identifier,
    required this.isSignUp,
  });

  @override
  ConsumerState<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage> {
  List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  int _timerSeconds = 60; // Dynamic timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timerSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _onKeyPress(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && controllers[index].text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void _verifyOtp() {
    String otpCode = controllers.map((c) => c.text).join();

    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a 6-digit OTP")),
      );
      return;
    }

    ref.read(otpProvider.notifier).verifyOtp(otpCode).then((success) {
      if (success) {
        if (widget.isSignUp) {
          context.go(RoutePaths.home);
        } else {
          context.go(RoutePaths.createNewPassword);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP. Try again.")),
        );
      }
    });
  }

  void _resendOtp() {
    // Reset the timer and resend OTP logic
    _startTimer();
    ref.read(resendOtpProvider.notifier).resendOtp(widget.identifier).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? "OTP resent successfully" : "Failed to resend OTP"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: widget.isSignUp ? "Verify Your Account" : AppStrings.forgotPassword,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appH(80),
          children: [
            Text(
              'Code has been sent to ${widget.identifier}',
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist
                  .regular(color: AppColors.greyScale.grey900, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) { // Updated to 6-digit
                return Container(
                  width: appW(50),
                  height: appH(63),
                  decoration: BoxDecoration(
                    color: focusNodes[index].hasFocus
                        ? AppColors.primary.blue100
                        : AppColors.greyScale.grey50,
                    borderRadius: BorderRadius.circular(appH(12)),
                    border: Border.all(
                      color: focusNodes[index].hasFocus
                          ? AppColors.primary.blue500
                          : AppColors.greyScale.grey200,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: AppTextStyles.urbanist
                        .bold(color: AppColors.greyScale.grey900, fontSize: 24),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _onKeyPress(value, index);
                        _onBackspace(index);
                      });
                    },
                  ),
                );
              }),
            ),
            Text(
              _timerSeconds > 0
                  ? "Resend code in $_timerSeconds s"
                  : "Didn't receive the code?",
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist
                  .regular(color: AppColors.greyScale.grey900, fontSize: 18),
            ),
            if (_timerSeconds == 0)
              TextButton(
                onPressed: _resendOtp,
                child: Text(
                  "Resend OTP",
                  style: AppTextStyles.urbanist.semiBold(
                      color: AppColors.primary.blue500, fontSize: 16),
                ),
              ),
            DefaultButtonWg(title: 'Verify', onPressed: _verifyOtp),
          ],
        ),
      ),
    );
  }
}
