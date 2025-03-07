import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/routes/route_paths.dart';
import '../../../../../../core/utils/utils_export.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: appH(32),
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/fg_congratulation.png",
              ),
              Text(
                AppStrings.congratulations,
                style: AppTextStyles.urbanist
                    .bold(color: AppColors.primary.blue500, fontSize: 24),
              ),
              Text(
                AppStrings.accountIsReady,
                textAlign: TextAlign.center,
                style: AppTextStyles.urbanist
                    .regular(color: AppColors.greyScale.grey900, fontSize: 16),
              ),
              SpinKitFadingCircle(
                color: AppColors.primary.blue500,
                size: 60.0,
              ),
            ],
          ),
        ),
      );
    },
  );

  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pop();
    context.go(RoutePaths.home);
  });
}
